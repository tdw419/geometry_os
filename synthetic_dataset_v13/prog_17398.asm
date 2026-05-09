; DESCRIPTION: Sets a single black pixel at (411, 188).
; PLAN: r0=411(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 411
LDI r1, 188
LDI r2, 0x000000
PSET r0, r1, r2
HALT
