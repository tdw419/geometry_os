; DESCRIPTION: Draws a red rectangle at (316, 121) with width 61 and height 82.
; PLAN: r0=316(x), r1=121(y), r2=61(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 121
LDI r2, 61
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
