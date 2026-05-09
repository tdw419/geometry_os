; DESCRIPTION: Sets a single black pixel at (310, 139).
; PLAN: r0=310(x), r1=139(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 310
LDI r1, 139
LDI r2, 0x000000
PSET r0, r1, r2
HALT
