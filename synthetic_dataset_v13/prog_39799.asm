; DESCRIPTION: Draws a orange rectangle at (353, 23) with width 72 and height 14.
; PLAN: r0=353(x), r1=23(y), r2=72(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 23
LDI r2, 72
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
