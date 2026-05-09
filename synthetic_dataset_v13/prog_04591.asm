; DESCRIPTION: Composite: Sets a single blue pixel at (433, 71) then Renders a purple box of size 41x71 starting at (325, 85).
; PLAN: r0=433(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=85(y), r7=41(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 71
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 325
LDI r6, 85
LDI r7, 41
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
