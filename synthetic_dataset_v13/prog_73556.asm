; DESCRIPTION: Places a purple dot at position (436, 243).
; PLAN: r0=436(x), r1=243(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 436
LDI r1, 243
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
