; DESCRIPTION: Creates a black rectangular region at (361, 67) spanning 108 by 15 pixels.
; PLAN: r0=361(x), r1=67(y), r2=108(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 67
LDI r2, 108
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
