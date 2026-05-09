; DESCRIPTION: Draws a orange rectangle at (353, 17) with width 90 and height 56.
; PLAN: r0=353(x), r1=17(y), r2=90(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 17
LDI r2, 90
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
