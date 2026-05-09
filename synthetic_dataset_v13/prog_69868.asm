; DESCRIPTION: Draws a blue rectangle at (161, 177) with width 34 and height 33.
; PLAN: r0=161(x), r1=177(y), r2=34(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 177
LDI r2, 34
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
