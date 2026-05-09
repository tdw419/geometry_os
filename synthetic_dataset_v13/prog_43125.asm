; DESCRIPTION: Places a black dot at position (510, 181).
; PLAN: r0=510(x), r1=181(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 510
LDI r1, 181
LDI r2, 0x000000
PSET r0, r1, r2
HALT
