; DESCRIPTION: Draws a black rectangle at (12, 62) with width 91 and height 40.
; PLAN: r0=12(x), r1=62(y), r2=91(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 62
LDI r2, 91
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
