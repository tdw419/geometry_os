; DESCRIPTION: Composite: Draws a blue line from (273, 229) to (388, 203) then Renders a orange disk with center (402, 167) and radius 14.
; PLAN: r0=273(x1), r1=229(y1), r2=388(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=167(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 273
LDI r1, 229
LDI r2, 388
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 167
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
