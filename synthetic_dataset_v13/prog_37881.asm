; DESCRIPTION: Composite: Renders a orange line between points (397, 23) and (72, 62) then Sets a single blue pixel at (156, 171).
; PLAN: r0=397(x1), r1=23(y1), r2=72(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=171(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 397
LDI r1, 23
LDI r2, 72
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 171
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
