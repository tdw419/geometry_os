; DESCRIPTION: Draws a yellow rectangle at (370, 2) with width 108 and height 34.
; PLAN: r0=370(x), r1=2(y), r2=108(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 2
LDI r2, 108
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
