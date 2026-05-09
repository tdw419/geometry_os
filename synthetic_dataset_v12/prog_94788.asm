; DESCRIPTION: Places a white circle of radius 62 at center (442, 154).
; PLAN: r0=442(x), r1=154(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 154
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
