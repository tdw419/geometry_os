; DESCRIPTION: Places a magenta dot at position (373, 122).
; PLAN: r0=373(x), r1=122(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 373
LDI r1, 122
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
