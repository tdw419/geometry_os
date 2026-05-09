; DESCRIPTION: Draws a white circle centered at (398, 192) with radius 62.
; PLAN: r0=398(x), r1=192(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 192
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
