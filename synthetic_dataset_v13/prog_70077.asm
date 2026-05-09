; DESCRIPTION: Draws a yellow rectangle at (8, 29) with width 55 and height 16.
; PLAN: r0=8(x), r1=29(y), r2=55(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 29
LDI r2, 55
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
