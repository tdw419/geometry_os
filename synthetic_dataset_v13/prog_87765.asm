; DESCRIPTION: Draws a yellow rectangle at (412, 25) with width 70 and height 95.
; PLAN: r0=412(x), r1=25(y), r2=70(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 25
LDI r2, 70
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
