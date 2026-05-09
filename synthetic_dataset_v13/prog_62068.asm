; DESCRIPTION: Places a black dot at position (446, 69).
; PLAN: r0=446(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
HALT
