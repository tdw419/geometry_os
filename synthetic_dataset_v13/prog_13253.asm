; DESCRIPTION: Sets a single black pixel at (215, 159).
; PLAN: r0=215(x), r1=159(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 159
LDI r2, 0x000000
PSET r0, r1, r2
HALT
