; DESCRIPTION: Composite: Draws a red circle centered at (200, 111) with radius 38 then Sets a single white pixel at (309, 168).
; PLAN: r0=200(x), r1=111(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=168(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 200
LDI r1, 111
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 168
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
