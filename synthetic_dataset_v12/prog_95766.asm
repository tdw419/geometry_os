; DESCRIPTION: Draws a yellow rectangle at (7, 213) with width 81 and height 37.
; PLAN: r0=7(x), r1=213(y), r2=81(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 213
LDI r2, 81
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
