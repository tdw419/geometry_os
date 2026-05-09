; DESCRIPTION: Draws a cyan rectangle at (17, 63) with width 99 and height 118.
; PLAN: r0=17(x), r1=63(y), r2=99(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 63
LDI r2, 99
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
