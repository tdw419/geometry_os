; DESCRIPTION: Places a black dot at position (208, 243).
; PLAN: r0=208(x), r1=243(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 243
LDI r2, 0x000000
PSET r0, r1, r2
HALT
