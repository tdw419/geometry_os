; DESCRIPTION: Creates a yellow rectangular region at (316, 63) spanning 40 by 60 pixels.
; PLAN: r0=316(x), r1=63(y), r2=40(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 63
LDI r2, 40
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
