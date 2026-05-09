; DESCRIPTION: Places a yellow dot at position (390, 193).
; PLAN: r0=390(x), r1=193(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 390
LDI r1, 193
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
