; DESCRIPTION: Sets a single green pixel at (113, 167).
; PLAN: r0=113(x), r1=167(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 167
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
