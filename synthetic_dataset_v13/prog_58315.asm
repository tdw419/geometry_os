; DESCRIPTION: Places a magenta dot at position (367, 128).
; PLAN: r0=367(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 367
LDI r1, 128
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
