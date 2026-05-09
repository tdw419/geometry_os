; DESCRIPTION: Sets a single green pixel at (404, 88).
; PLAN: r0=404(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 404
LDI r1, 88
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
