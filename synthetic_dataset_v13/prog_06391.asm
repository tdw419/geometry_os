; DESCRIPTION: Places a black dot at position (27, 9).
; PLAN: r0=27(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 9
LDI r2, 0x000000
PSET r0, r1, r2
HALT
