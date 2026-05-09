; DESCRIPTION: Places a purple dot at position (347, 5).
; PLAN: r0=347(x), r1=5(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 347
LDI r1, 5
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
