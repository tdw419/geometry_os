; DESCRIPTION: Places a purple dot at position (434, 69).
; PLAN: r0=434(x), r1=69(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 434
LDI r1, 69
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
