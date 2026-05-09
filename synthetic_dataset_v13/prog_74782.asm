; DESCRIPTION: Creates a white rectangular region at (416, 198) spanning 28 by 17 pixels.
; PLAN: r0=416(x), r1=198(y), r2=28(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 198
LDI r2, 28
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
