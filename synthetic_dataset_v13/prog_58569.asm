; DESCRIPTION: Sets a single cyan pixel at (184, 25).
; PLAN: r0=184(x), r1=25(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 25
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
