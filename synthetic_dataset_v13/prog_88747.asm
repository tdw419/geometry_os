; DESCRIPTION: Draws a cyan rectangle at (144, 96) with width 94 and height 76.
; PLAN: r0=144(x), r1=96(y), r2=94(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 96
LDI r2, 94
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
