; DESCRIPTION: Places a yellow dot at position (472, 252).
; PLAN: r0=472(x), r1=252(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 472
LDI r1, 252
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
