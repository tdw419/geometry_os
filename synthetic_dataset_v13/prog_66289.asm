; DESCRIPTION: Places a yellow dot at position (208, 186).
; PLAN: r0=208(x), r1=186(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 186
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
