; DESCRIPTION: Places a red dot at position (511, 141).
; PLAN: r0=511(x), r1=141(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 511
LDI r1, 141
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
