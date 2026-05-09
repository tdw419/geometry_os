; DESCRIPTION: Places a magenta dot at position (194, 106).
; PLAN: r0=194(x), r1=106(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 106
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
