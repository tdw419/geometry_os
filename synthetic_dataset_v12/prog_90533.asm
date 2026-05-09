; DESCRIPTION: Sets a single green pixel at (415, 243).
; PLAN: r0=415(x), r1=243(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 415
LDI r1, 243
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
