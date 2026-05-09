; DESCRIPTION: Composite: Draws a white circle centered at (379, 147) with radius 76 then Sets a single cyan pixel at (420, 153).
; PLAN: r0=379(x), r1=147(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=153(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 147
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 153
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
