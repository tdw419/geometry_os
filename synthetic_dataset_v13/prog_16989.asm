; DESCRIPTION: Draws a green rectangle at (291, 122) with width 64 and height 56.
; PLAN: r0=291(x), r1=122(y), r2=64(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 122
LDI r2, 64
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
