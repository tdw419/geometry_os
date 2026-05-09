; DESCRIPTION: Creates a white rectangular region at (312, 9) spanning 45 by 116 pixels.
; PLAN: r0=312(x), r1=9(y), r2=45(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 9
LDI r2, 45
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
