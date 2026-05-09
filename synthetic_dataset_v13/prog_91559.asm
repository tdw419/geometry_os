; DESCRIPTION: Composite: Sets a single purple pixel at (377, 121) then Creates a blue circular shape at (313, 120) with radius 17.
; PLAN: r0=377(x), r1=121(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=313(x), r6=120(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 121
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 313
LDI r6, 120
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
