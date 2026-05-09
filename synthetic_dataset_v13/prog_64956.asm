; DESCRIPTION: Draws a yellow rectangle at (425, 62) with width 38 and height 54.
; PLAN: r0=425(x), r1=62(y), r2=38(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 62
LDI r2, 38
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
