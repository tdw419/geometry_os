; DESCRIPTION: Sets a single green pixel at (410, 184).
; PLAN: r0=410(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 410
LDI r1, 184
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
