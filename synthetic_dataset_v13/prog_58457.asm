; DESCRIPTION: Draws a cyan rectangle at (23, 83) with width 117 and height 88.
; PLAN: r0=23(x), r1=83(y), r2=117(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 83
LDI r2, 117
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
