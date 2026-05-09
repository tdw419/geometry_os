; DESCRIPTION: Places a orange dot at position (172, 254).
; PLAN: r0=172(x), r1=254(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 254
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
