; DESCRIPTION: Draws a blue rectangle at (328, 114) with width 37 and height 40.
; PLAN: r0=328(x), r1=114(y), r2=37(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 114
LDI r2, 37
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
