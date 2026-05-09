; DESCRIPTION: Draws a green rectangle at (86, 72) with width 27 and height 106.
; PLAN: r0=86(x), r1=72(y), r2=27(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 72
LDI r2, 27
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
