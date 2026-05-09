; DESCRIPTION: Places a black dot at position (485, 238).
; PLAN: r0=485(x), r1=238(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 485
LDI r1, 238
LDI r2, 0x000000
PSET r0, r1, r2
HALT
