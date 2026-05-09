; DESCRIPTION: Draws a yellow rectangle at (255, 153) with width 30 and height 99.
; PLAN: r0=255(x), r1=153(y), r2=30(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 153
LDI r2, 30
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
