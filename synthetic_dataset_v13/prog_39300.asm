; DESCRIPTION: Draws a yellow rectangle at (126, 113) with width 44 and height 86.
; PLAN: r0=126(x), r1=113(y), r2=44(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 113
LDI r2, 44
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
