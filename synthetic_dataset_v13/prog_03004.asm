; DESCRIPTION: Places a magenta dot at position (110, 156).
; PLAN: r0=110(x), r1=156(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 156
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
