; DESCRIPTION: Places a green dot at position (485, 107).
; PLAN: r0=485(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 485
LDI r1, 107
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
