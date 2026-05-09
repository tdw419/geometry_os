; DESCRIPTION: Composite: Sets a single yellow pixel at (301, 115) then Draws a yellow circle centered at (474, 215) with radius 34.
; PLAN: r0=301(x), r1=115(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=474(x), r6=215(y), r7=34(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 115
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 474
LDI r6, 215
LDI r7, 34
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
