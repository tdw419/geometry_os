; DESCRIPTION: Draws a red rectangle at (132, 130) with width 24 and height 84.
; PLAN: r0=132(x), r1=130(y), r2=24(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 130
LDI r2, 24
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
