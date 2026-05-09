; DESCRIPTION: Places a magenta dot at position (379, 164).
; PLAN: r0=379(x), r1=164(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 379
LDI r1, 164
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
