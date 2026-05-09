; DESCRIPTION: Draws a yellow rectangle at (442, 165) with width 36 and height 70.
; PLAN: r0=442(x), r1=165(y), r2=36(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 165
LDI r2, 36
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
