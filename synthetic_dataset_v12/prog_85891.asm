; DESCRIPTION: Composite: Renders a red line between points (54, 39) and (330, 102) then Places a blue 110x86 rectangle at position (317, 127).
; PLAN: r0=54(x1), r1=39(y1), r2=330(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=127(y), r7=110(width), r8=86(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 39
LDI r2, 330
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 127
LDI r7, 110
LDI r8, 86
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
