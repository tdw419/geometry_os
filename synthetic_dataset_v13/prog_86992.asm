; DESCRIPTION: Composite: Places a white dot at position (340, 64) then Draws a blue circle centered at (447, 204) with radius 20.
; PLAN: r0=340(x), r1=64(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=204(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 64
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 447
LDI r6, 204
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
