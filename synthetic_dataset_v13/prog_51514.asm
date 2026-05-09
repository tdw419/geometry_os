; DESCRIPTION: Composite: Sets a single white pixel at (214, 121) then Draws a magenta circle centered at (300, 70) with radius 70.
; PLAN: r0=214(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=70(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 214
LDI r1, 121
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 300
LDI r6, 70
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
