; DESCRIPTION: Places a black dot at position (461, 223).
; PLAN: r0=461(x), r1=223(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 461
LDI r1, 223
LDI r2, 0x000000
PSET r0, r1, r2
HALT
