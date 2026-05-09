; DESCRIPTION: Draws a blue rectangle at (154, 23) with width 88 and height 21.
; PLAN: r0=154(x), r1=23(y), r2=88(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 23
LDI r2, 88
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
