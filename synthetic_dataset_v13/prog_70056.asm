; DESCRIPTION: Places a black dot at position (86, 63).
; PLAN: r0=86(x), r1=63(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 63
LDI r2, 0x000000
PSET r0, r1, r2
HALT
