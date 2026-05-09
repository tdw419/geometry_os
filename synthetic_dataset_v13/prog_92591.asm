; DESCRIPTION: Composite: Draws a green circle centered at (370, 167) with radius 55 then Sets a single white pixel at (371, 177).
; PLAN: r0=370(x), r1=167(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=177(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 167
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 177
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
