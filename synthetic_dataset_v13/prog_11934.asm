; DESCRIPTION: Places a purple dot at position (302, 226).
; PLAN: r0=302(x), r1=226(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 302
LDI r1, 226
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
