; DESCRIPTION: Places a magenta dot at position (390, 192).
; PLAN: r0=390(x), r1=192(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 390
LDI r1, 192
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
