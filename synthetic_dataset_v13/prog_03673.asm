; DESCRIPTION: Draws a yellow rectangle at (255, 92) with width 116 and height 22.
; PLAN: r0=255(x), r1=92(y), r2=116(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 92
LDI r2, 116
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
