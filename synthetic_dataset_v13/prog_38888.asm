; DESCRIPTION: Composite: Draws a white circle centered at (263, 179) with radius 60 then Sets a single green pixel at (108, 151).
; PLAN: r0=263(x), r1=179(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=151(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 179
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 151
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
