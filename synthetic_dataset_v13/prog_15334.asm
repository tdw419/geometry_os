; DESCRIPTION: Draws a orange rectangle at (353, 30) with width 82 and height 84.
; PLAN: r0=353(x), r1=30(y), r2=82(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 30
LDI r2, 82
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
