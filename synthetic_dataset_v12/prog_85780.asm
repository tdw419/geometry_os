; DESCRIPTION: Draws a yellow rectangle at (296, 30) with width 59 and height 109.
; PLAN: r0=296(x), r1=30(y), r2=59(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 30
LDI r2, 59
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
