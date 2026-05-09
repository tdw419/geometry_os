; DESCRIPTION: Composite: Sets a single yellow pixel at (313, 95) then Draws a white circle centered at (84, 206) with radius 36.
; PLAN: r0=313(x), r1=95(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=206(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 313
LDI r1, 95
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 84
LDI r6, 206
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
