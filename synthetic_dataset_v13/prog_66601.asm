; DESCRIPTION: Creates a black rectangular region at (67, 7) spanning 56 by 76 pixels.
; PLAN: r0=67(x), r1=7(y), r2=56(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 7
LDI r2, 56
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
