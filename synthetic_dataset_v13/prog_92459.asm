; DESCRIPTION: Places a yellow dot at position (504, 233).
; PLAN: r0=504(x), r1=233(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 233
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
