; DESCRIPTION: Places a red dot at position (273, 71).
; PLAN: r0=273(x), r1=71(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 273
LDI r1, 71
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
