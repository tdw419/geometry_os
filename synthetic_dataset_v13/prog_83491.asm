; DESCRIPTION: Draws a green rectangle at (345, 116) with width 96 and height 27.
; PLAN: r0=345(x), r1=116(y), r2=96(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 116
LDI r2, 96
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
