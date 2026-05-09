; DESCRIPTION: Draws a yellow rectangle at (214, 117) with width 88 and height 109.
; PLAN: r0=214(x), r1=117(y), r2=88(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 117
LDI r2, 88
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
