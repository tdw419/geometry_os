; DESCRIPTION: Composite: Draws a orange circle centered at (391, 123) with radius 29 then Draws a blue line from (191, 181) to (302, 229).
; PLAN: r0=391(x), r1=123(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x1), r6=181(y1), r7=302(x2), r8=229(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 123
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 181
LDI r7, 302
LDI r8, 229
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
