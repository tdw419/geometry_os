; DESCRIPTION: Places a red dot at position (83, 30).
; PLAN: r0=83(x), r1=30(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 30
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
