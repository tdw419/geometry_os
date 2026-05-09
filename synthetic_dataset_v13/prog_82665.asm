; DESCRIPTION: Places a purple dot at position (455, 153).
; PLAN: r0=455(x), r1=153(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 455
LDI r1, 153
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
