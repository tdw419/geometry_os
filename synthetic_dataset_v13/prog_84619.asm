; DESCRIPTION: Draws a blue rectangle at (395, 122) with width 10 and height 72.
; PLAN: r0=395(x), r1=122(y), r2=10(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 122
LDI r2, 10
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
