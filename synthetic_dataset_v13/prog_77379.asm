; DESCRIPTION: Draws a orange rectangle at (187, 67) with width 65 and height 66.
; PLAN: r0=187(x), r1=67(y), r2=65(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 67
LDI r2, 65
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
