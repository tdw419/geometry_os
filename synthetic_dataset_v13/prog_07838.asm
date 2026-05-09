; DESCRIPTION: Draws a cyan rectangle at (463, 212) with width 25 and height 29.
; PLAN: r0=463(x), r1=212(y), r2=25(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 212
LDI r2, 25
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
