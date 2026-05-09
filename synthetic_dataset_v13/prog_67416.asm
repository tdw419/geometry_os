; DESCRIPTION: Creates a blue rectangular region at (316, 100) spanning 96 by 20 pixels.
; PLAN: r0=316(x), r1=100(y), r2=96(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 100
LDI r2, 96
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
