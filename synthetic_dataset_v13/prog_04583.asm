; DESCRIPTION: Places a purple dot at position (340, 216).
; PLAN: r0=340(x), r1=216(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 340
LDI r1, 216
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
