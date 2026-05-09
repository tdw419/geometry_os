; DESCRIPTION: Places a purple dot at position (287, 162).
; PLAN: r0=287(x), r1=162(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 162
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
