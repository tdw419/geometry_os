; DESCRIPTION: Draws a red rectangle at (101, 49) with width 52 and height 86.
; PLAN: r0=101(x), r1=49(y), r2=52(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 49
LDI r2, 52
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
