; DESCRIPTION: Places a yellow dot at position (341, 3).
; PLAN: r0=341(x), r1=3(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 341
LDI r1, 3
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
