; DESCRIPTION: Composite: Creates a blue circular shape at (255, 165) with radius 38 then Sets a single yellow pixel at (135, 144).
; PLAN: r0=255(x), r1=165(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=144(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 165
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 144
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
