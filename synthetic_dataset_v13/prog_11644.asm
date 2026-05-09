; DESCRIPTION: Places a purple dot at position (116, 82).
; PLAN: r0=116(x), r1=82(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 82
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
