; DESCRIPTION: Composite: Renders a purple line between points (201, 172) and (240, 214) then Draws a black circle centered at (125, 128) with radius 79.
; PLAN: r0=201(x1), r1=172(y1), r2=240(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=128(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 172
LDI r2, 240
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 128
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
