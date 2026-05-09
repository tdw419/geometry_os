; DESCRIPTION: Sets a single black pixel at (214, 197).
; PLAN: r0=214(x), r1=197(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 197
LDI r2, 0x000000
PSET r0, r1, r2
HALT
