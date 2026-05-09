; DESCRIPTION: Sets a single cyan pixel at (388, 210).
; PLAN: r0=388(x), r1=210(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 388
LDI r1, 210
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
