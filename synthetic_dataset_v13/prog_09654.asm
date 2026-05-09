; DESCRIPTION: Composite: Renders a magenta disk with center (254, 142) and radius 69 then Sets a single red pixel at (499, 100).
; PLAN: r0=254(x), r1=142(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x), r6=100(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 142
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 100
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
