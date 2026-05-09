; DESCRIPTION: Draws a cyan rectangle at (0, 66) with width 62 and height 101.
; PLAN: r0=0(x), r1=66(y), r2=62(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 66
LDI r2, 62
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
