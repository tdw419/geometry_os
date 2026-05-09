; DESCRIPTION: Draws a yellow rectangle at (196, 59) with width 58 and height 79.
; PLAN: r0=196(x), r1=59(y), r2=58(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 59
LDI r2, 58
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
