; DESCRIPTION: Places a magenta dot at position (431, 63).
; PLAN: r0=431(x), r1=63(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 431
LDI r1, 63
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
