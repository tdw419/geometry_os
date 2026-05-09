; DESCRIPTION: Places a yellow dot at position (204, 141).
; PLAN: r0=204(x), r1=141(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 141
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
