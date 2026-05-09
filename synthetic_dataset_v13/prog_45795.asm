; DESCRIPTION: Composite: Sets a single white pixel at (360, 206) then Draws a magenta circle centered at (99, 135) with radius 64.
; PLAN: r0=360(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=135(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 135
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
