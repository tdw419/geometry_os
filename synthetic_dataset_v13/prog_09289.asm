; DESCRIPTION: Draws a green rectangle at (68, 130) with width 16 and height 76.
; PLAN: r0=68(x), r1=130(y), r2=16(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 130
LDI r2, 16
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
