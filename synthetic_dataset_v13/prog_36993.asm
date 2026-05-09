; DESCRIPTION: Draws a yellow rectangle at (245, 74) with width 119 and height 78.
; PLAN: r0=245(x), r1=74(y), r2=119(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 74
LDI r2, 119
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
