; DESCRIPTION: Creates a yellow rectangular region at (316, 114) spanning 86 by 54 pixels.
; PLAN: r0=316(x), r1=114(y), r2=86(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 114
LDI r2, 86
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
