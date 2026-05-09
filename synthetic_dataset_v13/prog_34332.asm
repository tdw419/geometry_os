; DESCRIPTION: Creates a red rectangular region at (316, 122) spanning 15 by 93 pixels.
; PLAN: r0=316(x), r1=122(y), r2=15(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 122
LDI r2, 15
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
