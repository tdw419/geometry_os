; DESCRIPTION: Places a magenta dot at position (236, 20).
; PLAN: r0=236(x), r1=20(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 20
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
