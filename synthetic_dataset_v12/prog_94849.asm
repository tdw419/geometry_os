; DESCRIPTION: Places a red dot at position (397, 118).
; PLAN: r0=397(x), r1=118(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 397
LDI r1, 118
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
