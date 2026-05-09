; DESCRIPTION: Draws a green rectangle at (358, 103) with width 88 and height 76.
; PLAN: r0=358(x), r1=103(y), r2=88(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 103
LDI r2, 88
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
