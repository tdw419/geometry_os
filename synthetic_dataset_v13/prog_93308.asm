; DESCRIPTION: Composite: Sets a single white pixel at (201, 64) then Renders a yellow line between points (203, 130) and (377, 160) then Draws a blue circle centered at (167, 144) with radius 53.
; PLAN: r0=201(x), r1=64(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=203(x1), r6=130(y1), r7=377(x2), r8=160(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=167(x), r11=144(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 64
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 130
LDI r7, 377
LDI r8, 160
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 144
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
