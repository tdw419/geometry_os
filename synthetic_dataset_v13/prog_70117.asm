; DESCRIPTION: Draws a black rectangle at (125, 48) with width 91 and height 67.
; PLAN: r0=125(x), r1=48(y), r2=91(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 48
LDI r2, 91
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
