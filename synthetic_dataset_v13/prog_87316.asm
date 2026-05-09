; DESCRIPTION: Places a magenta dot at position (249, 144).
; PLAN: r0=249(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
