; DESCRIPTION: Sets a single cyan pixel at (413, 172).
; PLAN: r0=413(x), r1=172(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 413
LDI r1, 172
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
