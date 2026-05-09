; DESCRIPTION: Draws a blue rectangle at (258, 114) with width 37 and height 46.
; PLAN: r0=258(x), r1=114(y), r2=37(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 114
LDI r2, 37
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
