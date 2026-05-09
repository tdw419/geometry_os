; DESCRIPTION: Draws a white circle centered at (274, 186) with radius 46.
; PLAN: r0=274(x), r1=186(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 186
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
