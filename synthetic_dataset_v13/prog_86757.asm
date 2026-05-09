; DESCRIPTION: Composite: Places a orange line segment connecting (207, 13) to (63, 206) then Sets a single blue pixel at (10, 229).
; PLAN: r0=207(x1), r1=13(y1), r2=63(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=229(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 207
LDI r1, 13
LDI r2, 63
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 229
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
