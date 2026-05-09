; DESCRIPTION: Places a yellow dot at position (210, 38).
; PLAN: r0=210(x), r1=38(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 38
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
