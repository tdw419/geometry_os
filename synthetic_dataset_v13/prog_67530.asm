; DESCRIPTION: Draws a yellow rectangle at (412, 36) with width 21 and height 101.
; PLAN: r0=412(x), r1=36(y), r2=21(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 36
LDI r2, 21
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
