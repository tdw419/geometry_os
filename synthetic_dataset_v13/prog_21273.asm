; DESCRIPTION: Draws a white circle centered at (371, 110) with radius 80.
; PLAN: r0=371(x), r1=110(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 110
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
