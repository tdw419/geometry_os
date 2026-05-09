; DESCRIPTION: Places a black dot at position (353, 150).
; PLAN: r0=353(x), r1=150(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 353
LDI r1, 150
LDI r2, 0x000000
PSET r0, r1, r2
HALT
