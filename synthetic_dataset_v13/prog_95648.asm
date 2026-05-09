; DESCRIPTION: Draws a yellow rectangle at (358, 172) with width 40 and height 56.
; PLAN: r0=358(x), r1=172(y), r2=40(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 172
LDI r2, 40
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
