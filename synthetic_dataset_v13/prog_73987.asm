; DESCRIPTION: Places a purple dot at position (290, 200).
; PLAN: r0=290(x), r1=200(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 290
LDI r1, 200
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
