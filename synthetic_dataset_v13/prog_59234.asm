; DESCRIPTION: Places a red dot at position (86, 19).
; PLAN: r0=86(x), r1=19(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 19
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
