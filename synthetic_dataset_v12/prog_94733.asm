; DESCRIPTION: Draws a yellow rectangle at (126, 90) with width 38 and height 113.
; PLAN: r0=126(x), r1=90(y), r2=38(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 90
LDI r2, 38
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
