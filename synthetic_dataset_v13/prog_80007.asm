; DESCRIPTION: Draws a yellow rectangle at (214, 67) with width 85 and height 14.
; PLAN: r0=214(x), r1=67(y), r2=85(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 67
LDI r2, 85
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
