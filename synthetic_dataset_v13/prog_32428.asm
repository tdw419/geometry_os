; DESCRIPTION: Draws a yellow rectangle at (353, 46) with width 47 and height 38.
; PLAN: r0=353(x), r1=46(y), r2=47(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 46
LDI r2, 47
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
