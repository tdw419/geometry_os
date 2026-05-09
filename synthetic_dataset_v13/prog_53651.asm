; DESCRIPTION: Composite: Places a cyan circle of radius 15 at center (376, 64) then Places a white line segment connecting (334, 105) to (374, 4).
; PLAN: r0=376(x), r1=64(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x1), r6=105(y1), r7=374(x2), r8=4(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 64
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 105
LDI r7, 374
LDI r8, 4
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
