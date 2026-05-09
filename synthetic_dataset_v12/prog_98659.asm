; DESCRIPTION: Sets a single green pixel at (135, 243).
; PLAN: r0=135(x), r1=243(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 243
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
