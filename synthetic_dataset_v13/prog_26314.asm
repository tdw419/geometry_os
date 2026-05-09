; DESCRIPTION: Sets a single green pixel at (214, 36).
; PLAN: r0=214(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 36
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
