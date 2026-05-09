; DESCRIPTION: Draws a black rectangle at (18, 130) with width 68 and height 120.
; PLAN: r0=18(x), r1=130(y), r2=68(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 130
LDI r2, 68
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
