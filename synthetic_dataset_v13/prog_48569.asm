; DESCRIPTION: Draws a yellow rectangle at (360, 10) with width 17 and height 102.
; PLAN: r0=360(x), r1=10(y), r2=17(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 10
LDI r2, 17
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
