; DESCRIPTION: Draws a green rectangle at (81, 111) with width 80 and height 86.
; PLAN: r0=81(x), r1=111(y), r2=80(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 111
LDI r2, 80
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
