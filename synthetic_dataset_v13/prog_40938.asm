; DESCRIPTION: Places a black dot at position (453, 206).
; PLAN: r0=453(x), r1=206(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 206
LDI r2, 0x000000
PSET r0, r1, r2
HALT
