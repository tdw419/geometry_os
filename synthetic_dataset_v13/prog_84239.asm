; DESCRIPTION: Draws a black rectangle at (216, 171) with width 14 and height 20.
; PLAN: r0=216(x), r1=171(y), r2=14(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 171
LDI r2, 14
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
