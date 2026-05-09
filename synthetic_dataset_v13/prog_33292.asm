; DESCRIPTION: Sets a single cyan pixel at (21, 163).
; PLAN: r0=21(x), r1=163(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 163
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
