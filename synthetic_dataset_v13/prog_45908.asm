; DESCRIPTION: Places a purple dot at position (467, 242).
; PLAN: r0=467(x), r1=242(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 467
LDI r1, 242
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
