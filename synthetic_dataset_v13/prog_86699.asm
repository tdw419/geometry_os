; DESCRIPTION: Draws a cyan rectangle at (448, 101) with width 13 and height 69.
; PLAN: r0=448(x), r1=101(y), r2=13(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 101
LDI r2, 13
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
