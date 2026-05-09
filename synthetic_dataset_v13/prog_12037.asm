; DESCRIPTION: Renders a white box of size 88x110 starting at (416, 107).
; PLAN: r0=416(x), r1=107(y), r2=88(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 107
LDI r2, 88
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
