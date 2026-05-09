; DESCRIPTION: Draws a yellow rectangle at (103, 20) with width 87 and height 29.
; PLAN: r0=103(x), r1=20(y), r2=87(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 20
LDI r2, 87
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
