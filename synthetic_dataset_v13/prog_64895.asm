; DESCRIPTION: Places a yellow dot at position (223, 155).
; PLAN: r0=223(x), r1=155(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 155
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
