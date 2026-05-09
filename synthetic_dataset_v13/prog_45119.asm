; DESCRIPTION: Draws a cyan rectangle at (361, 78) with width 88 and height 109.
; PLAN: r0=361(x), r1=78(y), r2=88(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 78
LDI r2, 88
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
