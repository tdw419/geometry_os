; DESCRIPTION: Creates a black rectangular region at (161, 203) spanning 54 by 14 pixels.
; PLAN: r0=161(x), r1=203(y), r2=54(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 203
LDI r2, 54
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
