; DESCRIPTION: Places a black dot at position (204, 29).
; PLAN: r0=204(x), r1=29(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 29
LDI r2, 0x000000
PSET r0, r1, r2
HALT
