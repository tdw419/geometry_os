; DESCRIPTION: Draws a yellow rectangle at (127, 138) with width 59 and height 26.
; PLAN: r0=127(x), r1=138(y), r2=59(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 138
LDI r2, 59
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
