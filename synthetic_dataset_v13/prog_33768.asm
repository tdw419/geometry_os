; DESCRIPTION: Composite: Creates a cyan rectangular region at (308, 86) spanning 43 by 117 pixels then Renders a blue line between points (54, 228) and (6, 199) then Places a red dot at position (216, 192).
; PLAN: r0=308(x), r1=86(y), r2=43(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x1), r6=228(y1), r7=6(x2), r8=199(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=192(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 308
LDI r1, 86
LDI r2, 43
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 228
LDI r7, 6
LDI r8, 199
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 192
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
