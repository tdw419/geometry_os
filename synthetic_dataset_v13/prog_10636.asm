; DESCRIPTION: Sets a single blue pixel at (403, 29).
; PLAN: r0=403(x), r1=29(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 403
LDI r1, 29
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
