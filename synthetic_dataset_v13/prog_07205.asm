; DESCRIPTION: Draws a cyan rectangle at (327, 77) with width 119 and height 101.
; PLAN: r0=327(x), r1=77(y), r2=119(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 77
LDI r2, 119
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
