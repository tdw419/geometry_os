; DESCRIPTION: Composite: Creates a magenta rectangular region at (201, 20) spanning 33 by 88 pixels then Renders a yellow line between points (65, 8) and (301, 96) then Places a purple dot at position (164, 100).
; PLAN: r0=201(x), r1=20(y), r2=33(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x1), r6=8(y1), r7=301(x2), r8=96(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=164(x), r11=100(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 20
LDI r2, 33
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 8
LDI r7, 301
LDI r8, 96
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 100
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
