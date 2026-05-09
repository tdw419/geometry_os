; DESCRIPTION: Places a red dot at position (85, 34).
; PLAN: r0=85(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 34
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
