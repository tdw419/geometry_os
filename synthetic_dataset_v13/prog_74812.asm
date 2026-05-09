; DESCRIPTION: Draws a green rectangle at (22, 129) with width 35 and height 53.
; PLAN: r0=22(x), r1=129(y), r2=35(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 129
LDI r2, 35
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
