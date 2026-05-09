; DESCRIPTION: Draws a yellow rectangle at (118, 57) with width 55 and height 95.
; PLAN: r0=118(x), r1=57(y), r2=55(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 57
LDI r2, 55
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
