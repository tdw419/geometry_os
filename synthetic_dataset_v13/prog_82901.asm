; DESCRIPTION: Places a red dot at position (156, 72).
; PLAN: r0=156(x), r1=72(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 72
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
