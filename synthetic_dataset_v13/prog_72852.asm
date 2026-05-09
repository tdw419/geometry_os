; DESCRIPTION: Composite: Places a purple circle of radius 60 at center (204, 69) then Sets a single orange pixel at (59, 131).
; PLAN: r0=204(x), r1=69(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x), r6=131(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 204
LDI r1, 69
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 131
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
