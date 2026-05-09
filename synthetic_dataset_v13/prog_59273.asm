; DESCRIPTION: Draws a cyan rectangle at (27, 101) with width 110 and height 53.
; PLAN: r0=27(x), r1=101(y), r2=110(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 101
LDI r2, 110
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
