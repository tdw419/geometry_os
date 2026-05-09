; DESCRIPTION: Sets a single cyan pixel at (322, 54).
; PLAN: r0=322(x), r1=54(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 322
LDI r1, 54
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
