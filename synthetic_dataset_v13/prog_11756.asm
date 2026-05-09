; DESCRIPTION: Draws a white circle centered at (321, 186) with radius 29.
; PLAN: r0=321(x), r1=186(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 186
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
