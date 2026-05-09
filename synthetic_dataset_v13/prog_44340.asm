; DESCRIPTION: Draws a red circle centered at (379, 152) with radius 43.
; PLAN: r0=379(x), r1=152(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 152
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
