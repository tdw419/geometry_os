; DESCRIPTION: Draws a blue rectangle at (289, 167) with width 38 and height 59.
; PLAN: r0=289(x), r1=167(y), r2=38(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 167
LDI r2, 38
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
