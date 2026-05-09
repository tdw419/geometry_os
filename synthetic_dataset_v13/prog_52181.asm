; DESCRIPTION: Draws a yellow rectangle at (117, 150) with width 30 and height 40.
; PLAN: r0=117(x), r1=150(y), r2=30(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 150
LDI r2, 30
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
