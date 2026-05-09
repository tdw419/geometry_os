; DESCRIPTION: Draws a green rectangle at (144, 52) with width 27 and height 34.
; PLAN: r0=144(x), r1=52(y), r2=27(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 52
LDI r2, 27
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
