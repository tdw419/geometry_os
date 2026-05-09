; DESCRIPTION: Composite: Draws a blue circle centered at (337, 103) with radius 55 then Sets a single white pixel at (184, 146).
; PLAN: r0=337(x), r1=103(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=146(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 337
LDI r1, 103
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 146
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
