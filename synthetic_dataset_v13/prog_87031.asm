; DESCRIPTION: Composite: Places a white circle of radius 70 at center (255, 83) then Sets a single purple pixel at (184, 25).
; PLAN: r0=255(x), r1=83(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=25(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 83
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 25
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
