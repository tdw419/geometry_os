; DESCRIPTION: Places a black dot at position (371, 171).
; PLAN: r0=371(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 371
LDI r1, 171
LDI r2, 0x000000
PSET r0, r1, r2
HALT
