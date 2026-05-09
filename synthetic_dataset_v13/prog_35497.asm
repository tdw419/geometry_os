; DESCRIPTION: Composite: Places a purple dot at position (67, 41) then Renders a white disk with center (324, 106) and radius 75.
; PLAN: r0=67(x), r1=41(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=106(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 67
LDI r1, 41
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 106
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
