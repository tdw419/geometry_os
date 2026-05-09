; DESCRIPTION: Places a black dot at position (345, 18).
; PLAN: r0=345(x), r1=18(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 345
LDI r1, 18
LDI r2, 0x000000
PSET r0, r1, r2
HALT
