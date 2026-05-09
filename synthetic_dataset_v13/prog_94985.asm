; DESCRIPTION: Draws a yellow rectangle at (430, 0) with width 13 and height 60.
; PLAN: r0=430(x), r1=0(y), r2=13(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 0
LDI r2, 13
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
