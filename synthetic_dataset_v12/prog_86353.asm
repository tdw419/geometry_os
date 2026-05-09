; DESCRIPTION: Sets a single cyan pixel at (429, 255).
; PLAN: r0=429(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 429
LDI r1, 255
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
