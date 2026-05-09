; DESCRIPTION: Composite: Places a blue circle of radius 35 at center (397, 178) then Sets a single magenta pixel at (19, 59).
; PLAN: r0=397(x), r1=178(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=59(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 397
LDI r1, 178
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 59
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
