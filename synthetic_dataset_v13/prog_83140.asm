; DESCRIPTION: Draws a blue rectangle at (420, 167) with width 23 and height 34.
; PLAN: r0=420(x), r1=167(y), r2=23(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 167
LDI r2, 23
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
