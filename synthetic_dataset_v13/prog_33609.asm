; DESCRIPTION: Draws a cyan rectangle at (179, 88) with width 102 and height 72.
; PLAN: r0=179(x), r1=88(y), r2=102(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 88
LDI r2, 102
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
