; DESCRIPTION: Places a magenta dot at position (49, 11).
; PLAN: r0=49(x), r1=11(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 11
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
