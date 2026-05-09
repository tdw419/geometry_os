; DESCRIPTION: Sets a single cyan pixel at (259, 192).
; PLAN: r0=259(x), r1=192(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 259
LDI r1, 192
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
