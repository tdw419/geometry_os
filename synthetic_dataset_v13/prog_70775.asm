; DESCRIPTION: Creates a white rectangular region at (316, 90) spanning 30 by 104 pixels.
; PLAN: r0=316(x), r1=90(y), r2=30(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 90
LDI r2, 30
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
