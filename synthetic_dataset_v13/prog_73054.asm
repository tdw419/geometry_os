; DESCRIPTION: Places a yellow dot at position (327, 227).
; PLAN: r0=327(x), r1=227(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 327
LDI r1, 227
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
