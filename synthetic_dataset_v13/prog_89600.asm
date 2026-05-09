; DESCRIPTION: Places a purple dot at position (169, 21).
; PLAN: r0=169(x), r1=21(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 21
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
