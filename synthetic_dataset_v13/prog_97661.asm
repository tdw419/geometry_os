; DESCRIPTION: Places a orange dot at position (485, 37).
; PLAN: r0=485(x), r1=37(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 485
LDI r1, 37
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
