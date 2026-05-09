; DESCRIPTION: Places a black dot at position (228, 161).
; PLAN: r0=228(x), r1=161(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 161
LDI r2, 0x000000
PSET r0, r1, r2
HALT
