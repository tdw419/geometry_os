; DESCRIPTION: Places a purple dot at position (476, 197).
; PLAN: r0=476(x), r1=197(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 476
LDI r1, 197
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
