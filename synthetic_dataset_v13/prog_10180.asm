; DESCRIPTION: Places a red dot at position (496, 60).
; PLAN: r0=496(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 496
LDI r1, 60
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
