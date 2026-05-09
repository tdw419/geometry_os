; DESCRIPTION: Draws a yellow rectangle at (411, 183) with width 65 and height 47.
; PLAN: r0=411(x), r1=183(y), r2=65(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 183
LDI r2, 65
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
