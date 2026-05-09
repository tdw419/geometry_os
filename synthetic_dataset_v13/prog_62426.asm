; DESCRIPTION: Places a purple dot at position (327, 36).
; PLAN: r0=327(x), r1=36(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 327
LDI r1, 36
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
