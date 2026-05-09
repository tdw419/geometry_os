; DESCRIPTION: Places a black dot at position (223, 151).
; PLAN: r0=223(x), r1=151(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 151
LDI r2, 0x000000
PSET r0, r1, r2
HALT
