; DESCRIPTION: Draws a cyan rectangle at (123, 49) with width 118 and height 24.
; PLAN: r0=123(x), r1=49(y), r2=118(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 49
LDI r2, 118
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
