; DESCRIPTION: Places a yellow dot at position (435, 110).
; PLAN: r0=435(x), r1=110(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 435
LDI r1, 110
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
