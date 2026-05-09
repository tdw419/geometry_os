; DESCRIPTION: Draws a cyan rectangle at (52, 5) with width 99 and height 114.
; PLAN: r0=52(x), r1=5(y), r2=99(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 5
LDI r2, 99
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
