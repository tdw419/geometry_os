; DESCRIPTION: Composite: Places a black dot at position (496, 25) then Renders a blue disk with center (281, 183) and radius 52.
; PLAN: r0=496(x), r1=25(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=183(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 496
LDI r1, 25
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 281
LDI r6, 183
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
