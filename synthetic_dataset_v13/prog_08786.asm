; DESCRIPTION: Places a red dot at position (471, 37).
; PLAN: r0=471(x), r1=37(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 471
LDI r1, 37
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
