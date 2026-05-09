; DESCRIPTION: Draws a black rectangle at (154, 130) with width 78 and height 68.
; PLAN: r0=154(x), r1=130(y), r2=78(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 130
LDI r2, 78
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
