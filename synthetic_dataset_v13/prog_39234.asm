; DESCRIPTION: Places a purple dot at position (277, 135).
; PLAN: r0=277(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 277
LDI r1, 135
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
