; DESCRIPTION: Creates a black rectangular region at (258, 114) spanning 97 by 88 pixels.
; PLAN: r0=258(x), r1=114(y), r2=97(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 114
LDI r2, 97
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
