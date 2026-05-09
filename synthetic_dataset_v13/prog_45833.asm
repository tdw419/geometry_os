; DESCRIPTION: Draws a yellow rectangle at (20, 55) with width 47 and height 45.
; PLAN: r0=20(x), r1=55(y), r2=47(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 55
LDI r2, 47
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
