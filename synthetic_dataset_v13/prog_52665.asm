; DESCRIPTION: Places a black dot at position (187, 186).
; PLAN: r0=187(x), r1=186(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 186
LDI r2, 0x000000
PSET r0, r1, r2
HALT
