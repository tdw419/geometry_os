; DESCRIPTION: Draws a green rectangle at (24, 24) with width 108 and height 28.
; PLAN: r0=24(x), r1=24(y), r2=108(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 24
LDI r2, 108
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
