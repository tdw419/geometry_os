; DESCRIPTION: Creates a red rectangular region at (316, 153) spanning 67 by 46 pixels.
; PLAN: r0=316(x), r1=153(y), r2=67(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 153
LDI r2, 67
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
