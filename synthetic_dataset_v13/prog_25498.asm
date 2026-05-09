; DESCRIPTION: Composite: Places a blue line segment connecting (293, 244) to (283, 9) then Sets a single red pixel at (160, 171).
; PLAN: r0=293(x1), r1=244(y1), r2=283(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=171(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 244
LDI r2, 283
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 171
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
