; DESCRIPTION: Draws a black rectangle at (214, 70) with width 77 and height 88.
; PLAN: r0=214(x), r1=70(y), r2=77(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 70
LDI r2, 77
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
