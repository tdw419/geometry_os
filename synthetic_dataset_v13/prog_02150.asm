; DESCRIPTION: Places a magenta dot at position (15, 139).
; PLAN: r0=15(x), r1=139(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 139
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
