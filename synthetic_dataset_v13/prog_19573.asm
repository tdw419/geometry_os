; DESCRIPTION: Sets a single cyan pixel at (400, 134).
; PLAN: r0=400(x), r1=134(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 134
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
