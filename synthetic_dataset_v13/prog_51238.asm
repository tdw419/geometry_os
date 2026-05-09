; DESCRIPTION: Places a blue dot at position (266, 173).
; PLAN: r0=266(x), r1=173(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 266
LDI r1, 173
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
