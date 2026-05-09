; DESCRIPTION: Places a yellow dot at position (373, 208).
; PLAN: r0=373(x), r1=208(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 373
LDI r1, 208
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
