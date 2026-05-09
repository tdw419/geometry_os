; DESCRIPTION: Places a red dot at position (79, 250).
; PLAN: r0=79(x), r1=250(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 250
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
