; DESCRIPTION: Draws a magenta rectangle at (406, 5) with width 97 and height 48.
; PLAN: r0=406(x), r1=5(y), r2=97(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 5
LDI r2, 97
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
