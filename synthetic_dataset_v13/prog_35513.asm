; DESCRIPTION: Draws a orange rectangle at (12, 115) with width 67 and height 71.
; PLAN: r0=12(x), r1=115(y), r2=67(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 115
LDI r2, 67
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
