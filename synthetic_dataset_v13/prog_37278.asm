; DESCRIPTION: Draws a green rectangle at (121, 148) with width 32 and height 46.
; PLAN: r0=121(x), r1=148(y), r2=32(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 148
LDI r2, 32
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
