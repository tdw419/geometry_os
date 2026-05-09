; DESCRIPTION: Sets a single cyan pixel at (224, 92).
; PLAN: r0=224(x), r1=92(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 92
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
