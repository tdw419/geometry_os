; DESCRIPTION: Places a magenta dot at position (145, 107).
; PLAN: r0=145(x), r1=107(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 107
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
