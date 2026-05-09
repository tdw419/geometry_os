; DESCRIPTION: Places a magenta dot at position (276, 232).
; PLAN: r0=276(x), r1=232(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 232
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
