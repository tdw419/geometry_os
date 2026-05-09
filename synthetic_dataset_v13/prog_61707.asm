; DESCRIPTION: Draws a yellow rectangle at (254, 70) with width 100 and height 103.
; PLAN: r0=254(x), r1=70(y), r2=100(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 70
LDI r2, 100
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
