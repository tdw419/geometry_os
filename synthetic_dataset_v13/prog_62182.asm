; DESCRIPTION: Draws a cyan rectangle at (86, 105) with width 20 and height 19.
; PLAN: r0=86(x), r1=105(y), r2=20(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 105
LDI r2, 20
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
