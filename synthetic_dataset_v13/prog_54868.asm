; DESCRIPTION: Composite: Renders a purple disk with center (150, 214) and radius 28 then Sets a single white pixel at (222, 103).
; PLAN: r0=150(x), r1=214(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=103(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 214
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 103
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
