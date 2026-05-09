; DESCRIPTION: Composite: Sets a single cyan pixel at (267, 95) then Places a purple circle of radius 33 at center (244, 223).
; PLAN: r0=267(x), r1=95(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=223(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 95
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 244
LDI r6, 223
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
