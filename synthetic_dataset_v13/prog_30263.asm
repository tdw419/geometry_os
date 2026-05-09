; DESCRIPTION: Places a purple dot at position (108, 60).
; PLAN: r0=108(x), r1=60(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 60
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
