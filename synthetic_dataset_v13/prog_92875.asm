; DESCRIPTION: Creates a orange rectangular region at (316, 12) spanning 113 by 72 pixels.
; PLAN: r0=316(x), r1=12(y), r2=113(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 12
LDI r2, 113
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
