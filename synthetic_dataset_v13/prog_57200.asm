; DESCRIPTION: Places a black dot at position (209, 205).
; PLAN: r0=209(x), r1=205(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 205
LDI r2, 0x000000
PSET r0, r1, r2
HALT
