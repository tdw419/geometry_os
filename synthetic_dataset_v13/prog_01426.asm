; DESCRIPTION: Draws a yellow rectangle at (103, 0) with width 117 and height 86.
; PLAN: r0=103(x), r1=0(y), r2=117(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 0
LDI r2, 117
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
