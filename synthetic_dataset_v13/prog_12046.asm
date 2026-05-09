; DESCRIPTION: Places a orange dot at position (426, 242).
; PLAN: r0=426(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 426
LDI r1, 242
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
