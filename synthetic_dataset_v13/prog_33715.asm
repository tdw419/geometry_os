; DESCRIPTION: Draws a yellow rectangle at (244, 109) with width 28 and height 110.
; PLAN: r0=244(x), r1=109(y), r2=28(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 109
LDI r2, 28
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
