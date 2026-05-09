; DESCRIPTION: Creates a black rectangular region at (17, 119) spanning 70 by 67 pixels.
; PLAN: r0=17(x), r1=119(y), r2=70(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 119
LDI r2, 70
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
