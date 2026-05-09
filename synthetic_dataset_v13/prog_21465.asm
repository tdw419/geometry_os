; DESCRIPTION: Composite: Places a white circle of radius 16 at center (135, 192) then Sets a single purple pixel at (501, 190).
; PLAN: r0=135(x), r1=192(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=501(x), r6=190(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 192
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 501
LDI r6, 190
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
