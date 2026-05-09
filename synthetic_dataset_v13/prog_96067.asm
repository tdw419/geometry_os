; DESCRIPTION: Places a black dot at position (255, 162).
; PLAN: r0=255(x), r1=162(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 162
LDI r2, 0x000000
PSET r0, r1, r2
HALT
