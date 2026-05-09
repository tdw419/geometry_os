; DESCRIPTION: Creates a green rectangular region at (316, 117) spanning 49 by 68 pixels.
; PLAN: r0=316(x), r1=117(y), r2=49(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 117
LDI r2, 49
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
