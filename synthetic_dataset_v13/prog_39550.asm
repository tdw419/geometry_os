; DESCRIPTION: Sets a single black pixel at (403, 70).
; PLAN: r0=403(x), r1=70(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 403
LDI r1, 70
LDI r2, 0x000000
PSET r0, r1, r2
HALT
