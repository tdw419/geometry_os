; DESCRIPTION: Composite: Places a red circle of radius 65 at center (254, 110) then Sets a single red pixel at (86, 95).
; PLAN: r0=254(x), r1=110(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=95(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 110
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 95
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
