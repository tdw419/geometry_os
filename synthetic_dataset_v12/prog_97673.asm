; DESCRIPTION: Places a blue dot at position (147, 229).
; PLAN: r0=147(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 229
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
