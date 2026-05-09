; DESCRIPTION: Draws a white circle centered at (115, 152) with radius 50.
; PLAN: r0=115(x), r1=152(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 152
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
