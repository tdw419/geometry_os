; DESCRIPTION: Composite: Places a green line segment connecting (199, 65) to (125, 122) then Sets a single orange pixel at (78, 33).
; PLAN: r0=199(x1), r1=65(y1), r2=125(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=33(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 199
LDI r1, 65
LDI r2, 125
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 33
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
