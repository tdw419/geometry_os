; DESCRIPTION: Creates a white circular shape at (350, 135) with radius 70.
; PLAN: r0=350(x), r1=135(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 135
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
