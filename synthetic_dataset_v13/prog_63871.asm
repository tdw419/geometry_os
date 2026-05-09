; DESCRIPTION: Places a magenta dot at position (343, 19).
; PLAN: r0=343(x), r1=19(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 343
LDI r1, 19
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
