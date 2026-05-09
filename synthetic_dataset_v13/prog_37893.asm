; DESCRIPTION: Places a black dot at position (413, 208).
; PLAN: r0=413(x), r1=208(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 413
LDI r1, 208
LDI r2, 0x000000
PSET r0, r1, r2
HALT
