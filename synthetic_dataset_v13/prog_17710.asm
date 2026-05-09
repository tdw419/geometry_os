; DESCRIPTION: Places a purple dot at position (150, 237).
; PLAN: r0=150(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 237
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
