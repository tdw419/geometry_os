; DESCRIPTION: Places a magenta dot at position (493, 116).
; PLAN: r0=493(x), r1=116(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 493
LDI r1, 116
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
