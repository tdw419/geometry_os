; DESCRIPTION: Composite: Sets a single purple pixel at (438, 74) then Places a cyan circle of radius 80 at center (416, 94).
; PLAN: r0=438(x), r1=74(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=94(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 74
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 416
LDI r6, 94
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
