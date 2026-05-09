; DESCRIPTION: Sets a single black pixel at (234, 190).
; PLAN: r0=234(x), r1=190(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 190
LDI r2, 0x000000
PSET r0, r1, r2
HALT
