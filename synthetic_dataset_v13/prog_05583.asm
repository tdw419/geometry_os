; DESCRIPTION: Places a red dot at position (275, 157).
; PLAN: r0=275(x), r1=157(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 275
LDI r1, 157
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
