; DESCRIPTION: Draws a yellow rectangle at (396, 16) with width 68 and height 96.
; PLAN: r0=396(x), r1=16(y), r2=68(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 16
LDI r2, 68
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
