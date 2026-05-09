; DESCRIPTION: Draws a yellow rectangle at (88, 38) with width 61 and height 71.
; PLAN: r0=88(x), r1=38(y), r2=61(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 38
LDI r2, 61
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
