; DESCRIPTION: Places a magenta dot at position (279, 89).
; PLAN: r0=279(x), r1=89(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 279
LDI r1, 89
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
