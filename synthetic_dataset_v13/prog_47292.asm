; DESCRIPTION: Draws a white circle centered at (177, 147) with radius 65.
; PLAN: r0=177(x), r1=147(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 147
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
