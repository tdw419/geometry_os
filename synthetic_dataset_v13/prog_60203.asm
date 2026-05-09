; DESCRIPTION: Creates a white rectangular region at (316, 2) spanning 31 by 22 pixels.
; PLAN: r0=316(x), r1=2(y), r2=31(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 2
LDI r2, 31
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
