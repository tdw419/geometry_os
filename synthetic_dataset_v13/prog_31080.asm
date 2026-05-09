; DESCRIPTION: Places a purple dot at position (385, 103).
; PLAN: r0=385(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 385
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
