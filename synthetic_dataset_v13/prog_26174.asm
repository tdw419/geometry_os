; DESCRIPTION: Sets a single cyan pixel at (210, 163).
; PLAN: r0=210(x), r1=163(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 163
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
