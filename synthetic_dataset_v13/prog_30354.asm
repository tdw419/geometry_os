; DESCRIPTION: Composite: Renders a purple disk with center (412, 127) and radius 58 then Sets a single magenta pixel at (421, 24).
; PLAN: r0=412(x), r1=127(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x), r6=24(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 412
LDI r1, 127
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 24
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
