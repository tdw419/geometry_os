; DESCRIPTION: Draws a orange rectangle at (108, 67) with width 71 and height 65.
; PLAN: r0=108(x), r1=67(y), r2=71(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 67
LDI r2, 71
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
