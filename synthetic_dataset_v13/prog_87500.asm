; DESCRIPTION: Draws a yellow rectangle at (245, 7) with width 101 and height 28.
; PLAN: r0=245(x), r1=7(y), r2=101(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 7
LDI r2, 101
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
