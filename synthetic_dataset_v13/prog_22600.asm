; DESCRIPTION: Draws a yellow rectangle at (161, 8) with width 85 and height 53.
; PLAN: r0=161(x), r1=8(y), r2=85(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 8
LDI r2, 85
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
