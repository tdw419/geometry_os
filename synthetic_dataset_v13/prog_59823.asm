; DESCRIPTION: Places a magenta dot at position (56, 95).
; PLAN: r0=56(x), r1=95(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 95
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
