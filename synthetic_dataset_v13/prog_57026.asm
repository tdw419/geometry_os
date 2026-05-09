; DESCRIPTION: Creates a black rectangular region at (316, 92) spanning 91 by 13 pixels.
; PLAN: r0=316(x), r1=92(y), r2=91(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 92
LDI r2, 91
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
