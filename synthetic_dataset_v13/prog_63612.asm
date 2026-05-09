; DESCRIPTION: Draws a yellow rectangle at (245, 8) with width 118 and height 109.
; PLAN: r0=245(x), r1=8(y), r2=118(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 8
LDI r2, 118
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
