; DESCRIPTION: Draws a orange rectangle at (165, 108) with width 95 and height 67.
; PLAN: r0=165(x), r1=108(y), r2=95(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 108
LDI r2, 95
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
