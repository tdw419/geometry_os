; DESCRIPTION: Composite: Places a blue dot at position (399, 239) then Renders a yellow disk with center (388, 92) and radius 77.
; PLAN: r0=399(x), r1=239(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=92(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 239
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 92
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
