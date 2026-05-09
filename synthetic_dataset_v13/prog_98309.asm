; DESCRIPTION: Renders a white box of size 110x35 starting at (270, 147).
; PLAN: r0=270(x), r1=147(y), r2=110(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 147
LDI r2, 110
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
