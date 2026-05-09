; DESCRIPTION: Composite: Draws a blue line from (453, 106) to (283, 24) then Places a orange circle of radius 29 at center (201, 198).
; PLAN: r0=453(x1), r1=106(y1), r2=283(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=198(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 453
LDI r1, 106
LDI r2, 283
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 198
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
