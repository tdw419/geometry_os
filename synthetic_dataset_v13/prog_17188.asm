; DESCRIPTION: Draws a yellow rectangle at (72, 207) with width 21 and height 40.
; PLAN: r0=72(x), r1=207(y), r2=21(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 207
LDI r2, 21
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
