; DESCRIPTION: Places a purple dot at position (237, 249).
; PLAN: r0=237(x), r1=249(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 249
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
