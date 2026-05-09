; DESCRIPTION: Draws a yellow rectangle at (300, 71) with width 54 and height 117.
; PLAN: r0=300(x), r1=71(y), r2=54(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 71
LDI r2, 54
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
