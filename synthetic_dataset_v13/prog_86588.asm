; DESCRIPTION: Draws a black rectangle at (115, 37) with width 108 and height 22.
; PLAN: r0=115(x), r1=37(y), r2=108(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 37
LDI r2, 108
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
