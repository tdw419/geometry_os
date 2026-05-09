; DESCRIPTION: Renders a white box of size 43x81 starting at (416, 138).
; PLAN: r0=416(x), r1=138(y), r2=43(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 138
LDI r2, 43
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
