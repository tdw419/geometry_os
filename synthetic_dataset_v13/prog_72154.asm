; DESCRIPTION: Creates a blue rectangular region at (316, 113) spanning 24 by 90 pixels.
; PLAN: r0=316(x), r1=113(y), r2=24(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 113
LDI r2, 24
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
