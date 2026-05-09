; DESCRIPTION: Sets a single cyan pixel at (349, 33).
; PLAN: r0=349(x), r1=33(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 33
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
