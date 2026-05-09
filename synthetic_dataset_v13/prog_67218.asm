; DESCRIPTION: Places a yellow dot at position (186, 149).
; PLAN: r0=186(x), r1=149(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 149
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
