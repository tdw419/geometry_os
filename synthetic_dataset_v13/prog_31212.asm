; DESCRIPTION: Places a red dot at position (426, 95).
; PLAN: r0=426(x), r1=95(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 426
LDI r1, 95
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
