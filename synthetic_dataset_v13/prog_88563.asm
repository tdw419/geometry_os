; DESCRIPTION: Draws a orange rectangle at (353, 92) with width 117 and height 92.
; PLAN: r0=353(x), r1=92(y), r2=117(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 92
LDI r2, 117
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
