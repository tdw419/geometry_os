; DESCRIPTION: Renders a yellow box of size 77x60 starting at (227, 189).
; PLAN: r0=227(x), r1=189(y), r2=77(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 189
LDI r2, 77
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
