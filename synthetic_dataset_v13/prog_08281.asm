; DESCRIPTION: Places a magenta dot at position (63, 22).
; PLAN: r0=63(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
