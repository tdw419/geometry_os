; DESCRIPTION: Sets a single black pixel at (215, 157).
; PLAN: r0=215(x), r1=157(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 157
LDI r2, 0x000000
PSET r0, r1, r2
HALT
