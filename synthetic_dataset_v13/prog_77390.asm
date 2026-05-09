; DESCRIPTION: Draws a green rectangle at (108, 72) with width 64 and height 116.
; PLAN: r0=108(x), r1=72(y), r2=64(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 72
LDI r2, 64
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
