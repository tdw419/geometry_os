; DESCRIPTION: Composite: Renders a orange disk with center (130, 101) and radius 63 then Places a blue line segment connecting (424, 68) to (383, 229).
; PLAN: r0=130(x), r1=101(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x1), r6=68(y1), r7=383(x2), r8=229(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 101
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 68
LDI r7, 383
LDI r8, 229
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
