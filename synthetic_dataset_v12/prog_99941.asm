; DESCRIPTION: Draws a blue rectangle at (21, 101) with width 12 and height 12.
; PLAN: r0=21(x), r1=101(y), r2=12(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 101
LDI r2, 12
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
