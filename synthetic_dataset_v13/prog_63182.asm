; DESCRIPTION: Composite: Sets a single red pixel at (298, 62) then Places a yellow circle of radius 28 at center (395, 206).
; PLAN: r0=298(x), r1=62(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=206(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 62
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 395
LDI r6, 206
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
