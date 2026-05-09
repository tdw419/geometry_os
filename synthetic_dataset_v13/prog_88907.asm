; DESCRIPTION: Draws a yellow rectangle at (187, 135) with width 100 and height 38.
; PLAN: r0=187(x), r1=135(y), r2=100(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 135
LDI r2, 100
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
