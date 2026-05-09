; DESCRIPTION: Places a black dot at position (350, 135).
; PLAN: r0=350(x), r1=135(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 350
LDI r1, 135
LDI r2, 0x000000
PSET r0, r1, r2
HALT
