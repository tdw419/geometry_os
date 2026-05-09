; DESCRIPTION: Draws a green rectangle at (346, 19) with width 36 and height 88.
; PLAN: r0=346(x), r1=19(y), r2=36(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 19
LDI r2, 36
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
