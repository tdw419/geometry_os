; DESCRIPTION: Sets a single black pixel at (188, 223).
; PLAN: r0=188(x), r1=223(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 223
LDI r2, 0x000000
PSET r0, r1, r2
HALT
