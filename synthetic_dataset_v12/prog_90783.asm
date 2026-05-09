; DESCRIPTION: Draws a red rectangle at (334, 75) with width 67 and height 78.
; PLAN: r0=334(x), r1=75(y), r2=67(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 75
LDI r2, 67
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
