; DESCRIPTION: Draws a cyan rectangle at (128, 7) with width 14 and height 118.
; PLAN: r0=128(x), r1=7(y), r2=14(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 7
LDI r2, 14
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
