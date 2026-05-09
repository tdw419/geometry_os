; DESCRIPTION: Sets a single black pixel at (385, 126).
; PLAN: r0=385(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 385
LDI r1, 126
LDI r2, 0x000000
PSET r0, r1, r2
HALT
