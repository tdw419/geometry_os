; DESCRIPTION: Places a magenta dot at position (191, 78).
; PLAN: r0=191(x), r1=78(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 78
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
