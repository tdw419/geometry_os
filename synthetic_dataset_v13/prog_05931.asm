; DESCRIPTION: Places a magenta dot at position (363, 199).
; PLAN: r0=363(x), r1=199(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 363
LDI r1, 199
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
