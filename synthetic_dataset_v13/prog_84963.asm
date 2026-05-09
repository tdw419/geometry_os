; DESCRIPTION: Creates a white rectangular region at (316, 52) spanning 84 by 13 pixels.
; PLAN: r0=316(x), r1=52(y), r2=84(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 52
LDI r2, 84
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
