; DESCRIPTION: Draws a red rectangle at (203, 108) with width 97 and height 16.
; PLAN: r0=203(x), r1=108(y), r2=97(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 108
LDI r2, 97
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
