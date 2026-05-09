; DESCRIPTION: Draws a yellow rectangle at (327, 88) with width 109 and height 12.
; PLAN: r0=327(x), r1=88(y), r2=109(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 88
LDI r2, 109
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
