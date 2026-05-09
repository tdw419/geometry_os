; DESCRIPTION: Places a green dot at position (272, 159).
; PLAN: r0=272(x), r1=159(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 272
LDI r1, 159
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
