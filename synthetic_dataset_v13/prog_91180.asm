; DESCRIPTION: Places a orange dot at position (235, 57).
; PLAN: r0=235(x), r1=57(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 57
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
