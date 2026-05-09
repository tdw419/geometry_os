; DESCRIPTION: Places a magenta dot at position (216, 189).
; PLAN: r0=216(x), r1=189(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 189
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
