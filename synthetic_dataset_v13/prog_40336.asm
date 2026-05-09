; DESCRIPTION: Places a black dot at position (344, 255).
; PLAN: r0=344(x), r1=255(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 255
LDI r2, 0x000000
PSET r0, r1, r2
HALT
