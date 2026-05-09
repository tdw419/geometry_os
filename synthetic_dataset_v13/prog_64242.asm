; DESCRIPTION: Places a magenta dot at position (114, 73).
; PLAN: r0=114(x), r1=73(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 73
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
