; DESCRIPTION: Draws a yellow rectangle at (128, 28) with width 112 and height 37.
; PLAN: r0=128(x), r1=28(y), r2=112(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 28
LDI r2, 112
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
