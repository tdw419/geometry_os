; DESCRIPTION: Composite: Sets a single white pixel at (511, 206) then Renders a purple disk with center (196, 167) and radius 17.
; PLAN: r0=511(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=167(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 511
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 167
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
