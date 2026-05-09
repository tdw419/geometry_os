; DESCRIPTION: Draws a yellow rectangle at (152, 8) with width 59 and height 118.
; PLAN: r0=152(x), r1=8(y), r2=59(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 8
LDI r2, 59
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
