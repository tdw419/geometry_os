; DESCRIPTION: Places a magenta dot at position (433, 140).
; PLAN: r0=433(x), r1=140(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 433
LDI r1, 140
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
