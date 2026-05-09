; DESCRIPTION: Draws a blue rectangle at (202, 141) with width 45 and height 88.
; PLAN: r0=202(x), r1=141(y), r2=45(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 141
LDI r2, 45
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
