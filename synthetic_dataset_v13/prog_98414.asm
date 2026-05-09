; DESCRIPTION: Draws a white circle centered at (173, 87) with radius 54.
; PLAN: r0=173(x), r1=87(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 87
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
