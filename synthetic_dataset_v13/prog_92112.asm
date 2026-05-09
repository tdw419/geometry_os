; DESCRIPTION: Creates a black rectangular region at (316, 114) spanning 74 by 44 pixels.
; PLAN: r0=316(x), r1=114(y), r2=74(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 114
LDI r2, 74
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
