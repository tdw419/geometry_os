; DESCRIPTION: Places a blue dot at position (303, 110).
; PLAN: r0=303(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 303
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
