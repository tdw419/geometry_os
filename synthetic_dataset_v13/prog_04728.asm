; DESCRIPTION: Places a blue dot at position (85, 46).
; PLAN: r0=85(x), r1=46(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 46
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
