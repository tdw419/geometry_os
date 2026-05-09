; DESCRIPTION: Sets a single black pixel at (397, 133).
; PLAN: r0=397(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 397
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
HALT
