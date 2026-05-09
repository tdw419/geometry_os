; DESCRIPTION: Places a purple dot at position (191, 172).
; PLAN: r0=191(x), r1=172(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 172
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
