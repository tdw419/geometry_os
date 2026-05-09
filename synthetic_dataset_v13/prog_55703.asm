; DESCRIPTION: Composite: Renders a orange line between points (356, 155) and (256, 27) then Sets a single yellow pixel at (329, 97).
; PLAN: r0=356(x1), r1=155(y1), r2=256(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=97(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 356
LDI r1, 155
LDI r2, 256
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 97
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
