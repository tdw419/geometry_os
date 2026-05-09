; DESCRIPTION: Draws a black rectangle at (216, 48) with width 91 and height 73.
; PLAN: r0=216(x), r1=48(y), r2=91(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 48
LDI r2, 91
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
