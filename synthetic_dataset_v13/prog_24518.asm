; DESCRIPTION: Places a red dot at position (473, 71).
; PLAN: r0=473(x), r1=71(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 473
LDI r1, 71
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
