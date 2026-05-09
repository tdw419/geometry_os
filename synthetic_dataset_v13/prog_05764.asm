; DESCRIPTION: Draws a green rectangle at (103, 32) with width 99 and height 29.
; PLAN: r0=103(x), r1=32(y), r2=99(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 32
LDI r2, 99
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
