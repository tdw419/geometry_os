; DESCRIPTION: Composite: Renders a magenta disk with center (481, 70) and radius 24 then Sets a single red pixel at (191, 138).
; PLAN: r0=481(x), r1=70(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=138(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 481
LDI r1, 70
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 138
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
