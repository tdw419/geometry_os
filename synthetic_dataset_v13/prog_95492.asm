; DESCRIPTION: Draws a yellow rectangle at (84, 12) with width 24 and height 42.
; PLAN: r0=84(x), r1=12(y), r2=24(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 12
LDI r2, 24
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
