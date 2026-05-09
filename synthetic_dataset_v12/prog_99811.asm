; DESCRIPTION: Places a magenta dot at position (106, 124).
; PLAN: r0=106(x), r1=124(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 124
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
