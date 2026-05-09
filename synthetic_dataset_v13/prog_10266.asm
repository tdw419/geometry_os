; DESCRIPTION: Places a magenta dot at position (74, 72).
; PLAN: r0=74(x), r1=72(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 72
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
