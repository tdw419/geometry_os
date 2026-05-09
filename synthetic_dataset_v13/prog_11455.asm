; DESCRIPTION: Draws a blue rectangle at (154, 54) with width 19 and height 27.
; PLAN: r0=154(x), r1=54(y), r2=19(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 54
LDI r2, 19
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
