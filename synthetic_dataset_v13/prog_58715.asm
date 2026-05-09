; DESCRIPTION: Sets a single cyan pixel at (304, 112).
; PLAN: r0=304(x), r1=112(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 304
LDI r1, 112
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
