; DESCRIPTION: Draws a cyan rectangle at (202, 25) with width 52 and height 88.
; PLAN: r0=202(x), r1=25(y), r2=52(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 25
LDI r2, 52
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
