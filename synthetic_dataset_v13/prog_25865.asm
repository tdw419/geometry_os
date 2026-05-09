; DESCRIPTION: Composite: Sets a single purple pixel at (441, 109) then Creates a purple rectangular region at (289, 4) spanning 41 by 117 pixels.
; PLAN: r0=441(x), r1=109(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=4(y), r7=41(width), r8=117(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 109
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 4
LDI r7, 41
LDI r8, 117
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
