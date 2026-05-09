; DESCRIPTION: Draws a cyan rectangle at (285, 30) with width 101 and height 66.
; PLAN: r0=285(x), r1=30(y), r2=101(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 30
LDI r2, 101
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
