; DESCRIPTION: Places a purple dot at position (134, 169).
; PLAN: r0=134(x), r1=169(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 169
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
