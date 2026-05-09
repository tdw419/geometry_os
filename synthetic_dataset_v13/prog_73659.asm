; DESCRIPTION: Draws a yellow rectangle at (306, 146) with width 100 and height 73.
; PLAN: r0=306(x), r1=146(y), r2=100(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 146
LDI r2, 100
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
