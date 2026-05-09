; DESCRIPTION: Draws a yellow rectangle at (294, 101) with width 21 and height 43.
; PLAN: r0=294(x), r1=101(y), r2=21(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 101
LDI r2, 21
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
