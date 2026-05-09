; DESCRIPTION: Creates a red rectangular region at (316, 86) spanning 103 by 65 pixels.
; PLAN: r0=316(x), r1=86(y), r2=103(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 86
LDI r2, 103
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
