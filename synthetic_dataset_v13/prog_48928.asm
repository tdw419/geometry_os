; DESCRIPTION: Places a black dot at position (488, 152).
; PLAN: r0=488(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 488
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
HALT
