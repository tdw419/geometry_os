; DESCRIPTION: Sets a single cyan pixel at (126, 198).
; PLAN: r0=126(x), r1=198(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 198
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
