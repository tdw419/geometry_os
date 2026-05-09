; DESCRIPTION: Draws a yellow rectangle at (213, 9) with width 12 and height 20.
; PLAN: r0=213(x), r1=9(y), r2=12(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 9
LDI r2, 12
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
