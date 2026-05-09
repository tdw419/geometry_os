; DESCRIPTION: Draws a yellow rectangle at (43, 25) with width 16 and height 117.
; PLAN: r0=43(x), r1=25(y), r2=16(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 25
LDI r2, 16
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
