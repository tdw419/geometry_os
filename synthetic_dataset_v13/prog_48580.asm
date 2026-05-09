; DESCRIPTION: Draws a red rectangle at (219, 28) with width 10 and height 101.
; PLAN: r0=219(x), r1=28(y), r2=10(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 28
LDI r2, 10
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
