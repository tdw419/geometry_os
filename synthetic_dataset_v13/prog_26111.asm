; DESCRIPTION: Places a yellow dot at position (133, 41).
; PLAN: r0=133(x), r1=41(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 41
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
