; DESCRIPTION: Creates a black rectangular region at (316, 102) spanning 67 by 54 pixels.
; PLAN: r0=316(x), r1=102(y), r2=67(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 102
LDI r2, 67
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
