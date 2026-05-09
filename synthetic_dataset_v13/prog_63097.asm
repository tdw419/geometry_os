; DESCRIPTION: Renders a black box of size 43x88 starting at (416, 104).
; PLAN: r0=416(x), r1=104(y), r2=43(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 104
LDI r2, 43
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
