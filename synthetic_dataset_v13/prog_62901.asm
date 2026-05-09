; DESCRIPTION: Draws a yellow rectangle at (209, 142) with width 68 and height 92.
; PLAN: r0=209(x), r1=142(y), r2=68(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 142
LDI r2, 68
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
