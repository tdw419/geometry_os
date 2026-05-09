; DESCRIPTION: Places a orange dot at position (93, 182).
; PLAN: r0=93(x), r1=182(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 182
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
