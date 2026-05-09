; DESCRIPTION: Sets a single blue pixel at (443, 161).
; PLAN: r0=443(x), r1=161(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 443
LDI r1, 161
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
