; DESCRIPTION: Composite: Places a blue circle of radius 62 at center (134, 151) then Sets a single red pixel at (134, 103).
; PLAN: r0=134(x), r1=151(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=103(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 151
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 103
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
