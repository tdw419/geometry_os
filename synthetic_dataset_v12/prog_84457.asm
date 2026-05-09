; DESCRIPTION: Draws a yellow rectangle at (212, 5) with width 49 and height 64.
; PLAN: r0=212(x), r1=5(y), r2=49(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 5
LDI r2, 49
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
