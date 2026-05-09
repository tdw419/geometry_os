; DESCRIPTION: Sets a single cyan pixel at (236, 138).
; PLAN: r0=236(x), r1=138(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 138
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
