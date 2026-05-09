; DESCRIPTION: Places a yellow dot at position (272, 133).
; PLAN: r0=272(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 272
LDI r1, 133
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
