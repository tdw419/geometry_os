; DESCRIPTION: Composite: Sets a single blue pixel at (286, 230) then Renders a white disk with center (398, 153) and radius 39.
; PLAN: r0=286(x), r1=230(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=153(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 230
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 398
LDI r6, 153
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
