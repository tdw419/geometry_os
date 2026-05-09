; DESCRIPTION: Places a red dot at position (458, 220).
; PLAN: r0=458(x), r1=220(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 458
LDI r1, 220
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
