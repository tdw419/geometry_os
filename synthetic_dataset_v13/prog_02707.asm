; DESCRIPTION: Places a white dot at position (272, 68).
; PLAN: r0=272(x), r1=68(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 272
LDI r1, 68
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
