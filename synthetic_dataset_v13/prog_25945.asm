; DESCRIPTION: Composite: Draws a yellow line from (443, 140) to (456, 187) then Renders a purple box of size 94x112 starting at (40, 11) then Creates a blue circular shape at (133, 85) with radius 57.
; PLAN: r0=443(x1), r1=140(y1), r2=456(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=11(y), r7=94(width), r8=112(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x), r11=85(y), r12=57(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 443
LDI r1, 140
LDI r2, 456
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 11
LDI r7, 94
LDI r8, 112
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 85
LDI r12, 57
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
