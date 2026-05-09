; DESCRIPTION: Draws a yellow rectangle at (454, 130) with width 37 and height 80.
; PLAN: r0=454(x), r1=130(y), r2=37(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 130
LDI r2, 37
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
