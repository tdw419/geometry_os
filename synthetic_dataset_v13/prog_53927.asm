; DESCRIPTION: Composite: Places a cyan line segment connecting (12, 33) to (224, 237) then Sets a single purple pixel at (436, 36).
; PLAN: r0=12(x1), r1=33(y1), r2=224(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=36(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 33
LDI r2, 224
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 36
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
