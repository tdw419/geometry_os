; DESCRIPTION: Draws a cyan rectangle at (72, 3) with width 101 and height 73.
; PLAN: r0=72(x), r1=3(y), r2=101(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 3
LDI r2, 101
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
