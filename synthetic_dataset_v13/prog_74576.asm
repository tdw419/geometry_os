; DESCRIPTION: Places a black dot at position (208, 133).
; PLAN: r0=208(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
HALT
