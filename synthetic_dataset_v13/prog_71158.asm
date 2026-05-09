; DESCRIPTION: Draws a yellow rectangle at (342, 69) with width 63 and height 20.
; PLAN: r0=342(x), r1=69(y), r2=63(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 69
LDI r2, 63
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
