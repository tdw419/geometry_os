; DESCRIPTION: Draws a blue rectangle at (86, 174) with width 27 and height 54.
; PLAN: r0=86(x), r1=174(y), r2=27(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 174
LDI r2, 27
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
