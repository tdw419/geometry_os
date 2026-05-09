; DESCRIPTION: Composite: Sets a single cyan pixel at (440, 165) then Places a green circle of radius 39 at center (314, 188).
; PLAN: r0=440(x), r1=165(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=188(y), r7=39(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 165
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 314
LDI r6, 188
LDI r7, 39
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
