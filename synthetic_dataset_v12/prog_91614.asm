; DESCRIPTION: Sets a single green pixel at (86, 198).
; PLAN: r0=86(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
