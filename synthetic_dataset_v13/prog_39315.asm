; DESCRIPTION: Places a magenta dot at position (476, 234).
; PLAN: r0=476(x), r1=234(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 476
LDI r1, 234
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
