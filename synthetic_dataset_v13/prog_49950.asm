; DESCRIPTION: Places a black dot at position (256, 60).
; PLAN: r0=256(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
HALT
