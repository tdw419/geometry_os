; DESCRIPTION: Draws a yellow rectangle at (109, 30) with width 62 and height 71.
; PLAN: r0=109(x), r1=30(y), r2=62(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 30
LDI r2, 62
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
