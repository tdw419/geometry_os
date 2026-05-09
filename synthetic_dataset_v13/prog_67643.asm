; DESCRIPTION: Draws a cyan rectangle at (81, 131) with width 101 and height 49.
; PLAN: r0=81(x), r1=131(y), r2=101(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 131
LDI r2, 101
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
