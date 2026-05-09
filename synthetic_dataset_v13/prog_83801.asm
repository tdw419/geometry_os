; DESCRIPTION: Draws a yellow rectangle at (181, 70) with width 64 and height 87.
; PLAN: r0=181(x), r1=70(y), r2=64(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 70
LDI r2, 64
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
