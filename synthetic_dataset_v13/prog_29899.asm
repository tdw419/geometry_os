; DESCRIPTION: Composite: Sets a single black pixel at (458, 187) then Renders a purple disk with center (173, 148) and radius 68.
; PLAN: r0=458(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=148(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 458
LDI r1, 187
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 173
LDI r6, 148
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
