; DESCRIPTION: Sets a single cyan pixel at (482, 69).
; PLAN: r0=482(x), r1=69(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 482
LDI r1, 69
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
