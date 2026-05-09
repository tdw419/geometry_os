; DESCRIPTION: Composite: Sets a single blue pixel at (385, 206) then Renders a green disk with center (204, 112) and radius 30.
; PLAN: r0=385(x), r1=206(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=112(y), r7=30(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 385
LDI r1, 206
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 112
LDI r7, 30
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
