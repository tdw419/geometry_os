; DESCRIPTION: Places a yellow dot at position (308, 172).
; PLAN: r0=308(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 172
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
