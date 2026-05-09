; DESCRIPTION: Places a purple dot at position (456, 70).
; PLAN: r0=456(x), r1=70(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 456
LDI r1, 70
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
