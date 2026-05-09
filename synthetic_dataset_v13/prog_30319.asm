; DESCRIPTION: Draws a yellow rectangle at (214, 158) with width 47 and height 37.
; PLAN: r0=214(x), r1=158(y), r2=47(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 158
LDI r2, 47
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
