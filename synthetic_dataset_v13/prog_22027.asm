; DESCRIPTION: Draws a cyan rectangle at (118, 234) with width 96 and height 20.
; PLAN: r0=118(x), r1=234(y), r2=96(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 234
LDI r2, 96
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
