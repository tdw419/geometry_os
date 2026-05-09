; DESCRIPTION: Composite: Sets a single purple pixel at (353, 77) then Renders a orange disk with center (83, 116) and radius 72.
; PLAN: r0=353(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=116(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 353
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 116
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
