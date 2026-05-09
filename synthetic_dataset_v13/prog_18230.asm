; DESCRIPTION: Places a magenta dot at position (324, 13).
; PLAN: r0=324(x), r1=13(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 324
LDI r1, 13
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
