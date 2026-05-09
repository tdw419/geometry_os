; DESCRIPTION: Places a black dot at position (260, 188).
; PLAN: r0=260(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 260
LDI r1, 188
LDI r2, 0x000000
PSET r0, r1, r2
HALT
