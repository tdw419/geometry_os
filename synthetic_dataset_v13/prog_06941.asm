; DESCRIPTION: Places a magenta dot at position (351, 200).
; PLAN: r0=351(x), r1=200(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 351
LDI r1, 200
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
