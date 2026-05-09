; DESCRIPTION: Draws a yellow rectangle at (249, 21) with width 19 and height 56.
; PLAN: r0=249(x), r1=21(y), r2=19(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 21
LDI r2, 19
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
