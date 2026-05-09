; DESCRIPTION: Draws a yellow rectangle at (108, 126) with width 84 and height 69.
; PLAN: r0=108(x), r1=126(y), r2=84(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 126
LDI r2, 84
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
