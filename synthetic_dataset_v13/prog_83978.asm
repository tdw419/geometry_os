; DESCRIPTION: Places a black dot at position (373, 160).
; PLAN: r0=373(x), r1=160(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 373
LDI r1, 160
LDI r2, 0x000000
PSET r0, r1, r2
HALT
