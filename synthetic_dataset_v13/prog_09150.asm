; DESCRIPTION: Places a black dot at position (146, 137).
; PLAN: r0=146(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
HALT
