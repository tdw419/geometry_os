; DESCRIPTION: Draws a white rectangle at (22, 38) with width 62 and height 92.
; PLAN: r0=22(x), r1=38(y), r2=62(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 38
LDI r2, 62
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
