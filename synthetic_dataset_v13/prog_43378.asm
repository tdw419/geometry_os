; DESCRIPTION: Draws a yellow rectangle at (168, 102) with width 66 and height 119.
; PLAN: r0=168(x), r1=102(y), r2=66(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 102
LDI r2, 66
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
