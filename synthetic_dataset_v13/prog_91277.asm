; DESCRIPTION: Sets a single cyan pixel at (463, 167).
; PLAN: r0=463(x), r1=167(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 463
LDI r1, 167
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
