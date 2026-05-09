; DESCRIPTION: Places a black dot at position (186, 56).
; PLAN: r0=186(x), r1=56(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 56
LDI r2, 0x000000
PSET r0, r1, r2
HALT
