; DESCRIPTION: Places a yellow dot at position (402, 38).
; PLAN: r0=402(x), r1=38(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 402
LDI r1, 38
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
