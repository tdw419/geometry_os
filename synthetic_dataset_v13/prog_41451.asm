; DESCRIPTION: Composite: Renders a yellow box of size 106x119 starting at (154, 70) then Places a purple dot at position (314, 81) then Renders a white line between points (109, 43) and (201, 121).
; PLAN: r0=154(x), r1=70(y), r2=106(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=81(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=109(x1), r11=43(y1), r12=201(x2), r13=121(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 70
LDI r2, 106
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 81
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 109
LDI r11, 43
LDI r12, 201
LDI r13, 121
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
