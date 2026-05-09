; DESCRIPTION: Composite: Sets a single red pixel at (468, 222) then Places a green circle of radius 49 at center (210, 95).
; PLAN: r0=468(x), r1=222(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=95(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 222
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 210
LDI r6, 95
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
