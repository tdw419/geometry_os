; DESCRIPTION: Places a yellow dot at position (409, 169).
; PLAN: r0=409(x), r1=169(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 409
LDI r1, 169
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
