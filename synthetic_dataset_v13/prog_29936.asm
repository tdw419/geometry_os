; DESCRIPTION: Creates a blue rectangular region at (316, 27) spanning 92 by 61 pixels.
; PLAN: r0=316(x), r1=27(y), r2=92(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 27
LDI r2, 92
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
