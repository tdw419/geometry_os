; DESCRIPTION: Places a yellow dot at position (266, 219).
; PLAN: r0=266(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 266
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
