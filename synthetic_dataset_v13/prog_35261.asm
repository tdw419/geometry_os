; DESCRIPTION: Places a purple dot at position (281, 44).
; PLAN: r0=281(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 281
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
