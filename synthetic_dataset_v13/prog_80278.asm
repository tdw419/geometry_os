; DESCRIPTION: Places a purple dot at position (209, 33).
; PLAN: r0=209(x), r1=33(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 33
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
