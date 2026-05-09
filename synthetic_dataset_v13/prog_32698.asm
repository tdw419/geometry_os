; DESCRIPTION: Places a red dot at position (399, 73).
; PLAN: r0=399(x), r1=73(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 399
LDI r1, 73
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
