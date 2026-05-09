; DESCRIPTION: Places a purple dot at position (291, 125).
; PLAN: r0=291(x), r1=125(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 291
LDI r1, 125
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
