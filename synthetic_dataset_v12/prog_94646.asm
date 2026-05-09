; DESCRIPTION: Places a yellow dot at position (299, 150).
; PLAN: r0=299(x), r1=150(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 299
LDI r1, 150
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
