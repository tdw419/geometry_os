; DESCRIPTION: Renders a green box of size 77x69 starting at (266, 133).
; PLAN: r0=266(x), r1=133(y), r2=77(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 133
LDI r2, 77
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
