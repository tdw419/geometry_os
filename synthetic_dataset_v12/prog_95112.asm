; DESCRIPTION: Places a red dot at position (238, 72).
; PLAN: r0=238(x), r1=72(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 72
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
