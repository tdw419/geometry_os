; DESCRIPTION: Places a orange dot at position (126, 237).
; PLAN: r0=126(x), r1=237(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 237
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
