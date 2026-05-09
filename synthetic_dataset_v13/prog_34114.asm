; DESCRIPTION: Places a magenta dot at position (98, 194).
; PLAN: r0=98(x), r1=194(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 194
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
