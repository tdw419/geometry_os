; DESCRIPTION: Places a purple dot at position (170, 239).
; PLAN: r0=170(x), r1=239(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 239
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
