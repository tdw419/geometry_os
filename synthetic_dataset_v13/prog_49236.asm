; DESCRIPTION: Composite: Draws a yellow circle centered at (145, 178) with radius 63 then Places a orange line segment connecting (404, 55) to (29, 205).
; PLAN: r0=145(x), r1=178(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x1), r6=55(y1), r7=29(x2), r8=205(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 178
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 55
LDI r7, 29
LDI r8, 205
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
