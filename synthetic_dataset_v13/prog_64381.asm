; DESCRIPTION: Places a cyan dot at position (496, 69).
; PLAN: r0=496(x), r1=69(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 496
LDI r1, 69
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
