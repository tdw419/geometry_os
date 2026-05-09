; DESCRIPTION: Draws a yellow rectangle at (273, 3) with width 81 and height 16.
; PLAN: r0=273(x), r1=3(y), r2=81(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 3
LDI r2, 81
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
