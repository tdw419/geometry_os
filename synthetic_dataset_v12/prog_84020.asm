; DESCRIPTION: Places a magenta dot at position (148, 147).
; PLAN: r0=148(x), r1=147(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 147
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
