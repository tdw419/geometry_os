; DESCRIPTION: Places a purple dot at position (73, 125).
; PLAN: r0=73(x), r1=125(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 125
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
