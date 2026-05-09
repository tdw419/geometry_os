; DESCRIPTION: Places a red dot at position (367, 76).
; PLAN: r0=367(x), r1=76(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 367
LDI r1, 76
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
