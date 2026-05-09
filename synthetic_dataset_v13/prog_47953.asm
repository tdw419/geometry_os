; DESCRIPTION: Draws a green rectangle at (161, 44) with width 58 and height 53.
; PLAN: r0=161(x), r1=44(y), r2=58(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 44
LDI r2, 58
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
