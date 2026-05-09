; DESCRIPTION: Draws a cyan rectangle at (377, 101) with width 81 and height 49.
; PLAN: r0=377(x), r1=101(y), r2=81(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 101
LDI r2, 81
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
