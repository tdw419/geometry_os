; DESCRIPTION: Places a purple dot at position (416, 77).
; PLAN: r0=416(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 416
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
