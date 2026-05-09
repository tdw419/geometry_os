; DESCRIPTION: Composite: Renders a cyan line between points (105, 118) and (134, 33) then Creates a red rectangular region at (104, 61) spanning 50 by 56 pixels then Places a green dot at position (192, 1).
; PLAN: r0=105(x1), r1=118(y1), r2=134(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=61(y), r7=50(width), r8=56(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x), r11=1(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 118
LDI r2, 134
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 61
LDI r7, 50
LDI r8, 56
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 1
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
