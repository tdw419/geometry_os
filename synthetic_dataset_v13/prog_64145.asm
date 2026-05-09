; DESCRIPTION: Draws a green rectangle at (336, 130) with width 60 and height 59.
; PLAN: r0=336(x), r1=130(y), r2=60(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 130
LDI r2, 60
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
