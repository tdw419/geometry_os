; DESCRIPTION: Creates a green rectangular region at (316, 199) spanning 69 by 54 pixels.
; PLAN: r0=316(x), r1=199(y), r2=69(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 199
LDI r2, 69
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
