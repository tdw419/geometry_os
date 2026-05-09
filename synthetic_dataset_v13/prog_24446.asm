; DESCRIPTION: Creates a white rectangular region at (316, 14) spanning 107 by 58 pixels.
; PLAN: r0=316(x), r1=14(y), r2=107(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 14
LDI r2, 107
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
