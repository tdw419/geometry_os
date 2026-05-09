; DESCRIPTION: Draws a green rectangle at (150, 76) with width 59 and height 116.
; PLAN: r0=150(x), r1=76(y), r2=59(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 76
LDI r2, 59
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
