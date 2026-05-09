; DESCRIPTION: Draws a magenta rectangle at (453, 115) with width 27 and height 99.
; PLAN: r0=453(x), r1=115(y), r2=27(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 115
LDI r2, 27
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
