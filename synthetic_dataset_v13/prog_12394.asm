; DESCRIPTION: Draws a white rectangle at (316, 0) with width 42 and height 85.
; PLAN: r0=316(x), r1=0(y), r2=42(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 0
LDI r2, 42
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
