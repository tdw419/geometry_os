; DESCRIPTION: Composite: Sets a single black pixel at (210, 236) then Draws a green circle centered at (434, 178) with radius 64.
; PLAN: r0=210(x), r1=236(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=178(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 210
LDI r1, 236
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 434
LDI r6, 178
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
