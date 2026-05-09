; DESCRIPTION: Places a magenta dot at position (484, 250).
; PLAN: r0=484(x), r1=250(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 484
LDI r1, 250
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
