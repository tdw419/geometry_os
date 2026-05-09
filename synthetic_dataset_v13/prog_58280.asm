; DESCRIPTION: Places a red dot at position (359, 112).
; PLAN: r0=359(x), r1=112(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 359
LDI r1, 112
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
