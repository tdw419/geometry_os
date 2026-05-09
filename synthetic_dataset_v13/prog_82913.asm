; DESCRIPTION: Composite: Places a white dot at position (458, 72) then Renders a white disk with center (171, 79) and radius 58.
; PLAN: r0=458(x), r1=72(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=79(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 458
LDI r1, 72
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 79
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
