; DESCRIPTION: Draws a orange rectangle at (335, 114) with width 67 and height 115.
; PLAN: r0=335(x), r1=114(y), r2=67(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 114
LDI r2, 67
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
