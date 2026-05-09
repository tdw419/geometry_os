; DESCRIPTION: Draws a yellow rectangle at (153, 132) with width 24 and height 64.
; PLAN: r0=153(x), r1=132(y), r2=24(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 132
LDI r2, 24
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
