; DESCRIPTION: Sets a single cyan pixel at (365, 169).
; PLAN: r0=365(x), r1=169(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 365
LDI r1, 169
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
