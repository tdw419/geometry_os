; DESCRIPTION: Sets a single green pixel at (176, 182).
; PLAN: r0=176(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 182
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
