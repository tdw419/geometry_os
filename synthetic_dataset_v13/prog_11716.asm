; DESCRIPTION: Places a purple dot at position (245, 103).
; PLAN: r0=245(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
