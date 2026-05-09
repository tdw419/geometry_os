; DESCRIPTION: Draws a green rectangle at (65, 81) with width 53 and height 33.
; PLAN: r0=65(x), r1=81(y), r2=53(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 81
LDI r2, 53
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
