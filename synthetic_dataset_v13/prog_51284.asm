; DESCRIPTION: Draws a yellow rectangle at (35, 28) with width 38 and height 24.
; PLAN: r0=35(x), r1=28(y), r2=38(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 28
LDI r2, 38
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
