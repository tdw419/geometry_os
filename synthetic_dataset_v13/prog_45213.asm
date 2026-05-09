; DESCRIPTION: Composite: Sets a single green pixel at (435, 136) then Draws a yellow circle centered at (454, 116) with radius 52.
; PLAN: r0=435(x), r1=136(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=116(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 435
LDI r1, 136
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 454
LDI r6, 116
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
