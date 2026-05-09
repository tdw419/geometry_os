; DESCRIPTION: Sets a single cyan pixel at (254, 57).
; PLAN: r0=254(x), r1=57(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 254
LDI r1, 57
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
