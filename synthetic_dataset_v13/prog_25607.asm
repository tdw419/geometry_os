; DESCRIPTION: Draws a yellow rectangle at (330, 0) with width 25 and height 60.
; PLAN: r0=330(x), r1=0(y), r2=25(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 0
LDI r2, 25
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
