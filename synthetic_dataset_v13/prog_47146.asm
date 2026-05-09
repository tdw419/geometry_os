; DESCRIPTION: Sets a single cyan pixel at (173, 83).
; PLAN: r0=173(x), r1=83(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 83
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
