; DESCRIPTION: Places a red dot at position (444, 78).
; PLAN: r0=444(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 444
LDI r1, 78
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
