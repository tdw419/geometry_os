; DESCRIPTION: Draws a blue rectangle at (368, 22) with width 58 and height 46.
; PLAN: r0=368(x), r1=22(y), r2=58(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 22
LDI r2, 58
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
