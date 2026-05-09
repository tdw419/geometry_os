; DESCRIPTION: Places a black dot at position (456, 180).
; PLAN: r0=456(x), r1=180(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 456
LDI r1, 180
LDI r2, 0x000000
PSET r0, r1, r2
HALT
