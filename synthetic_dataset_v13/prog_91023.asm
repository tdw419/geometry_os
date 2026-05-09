; DESCRIPTION: Draws a yellow rectangle at (29, 72) with width 95 and height 40.
; PLAN: r0=29(x), r1=72(y), r2=95(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 72
LDI r2, 95
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
