; DESCRIPTION: Draws a blue rectangle at (454, 167) with width 27 and height 49.
; PLAN: r0=454(x), r1=167(y), r2=27(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 167
LDI r2, 27
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
