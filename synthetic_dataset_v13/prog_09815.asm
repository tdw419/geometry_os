; DESCRIPTION: Draws a green rectangle at (473, 42) with width 17 and height 100.
; PLAN: r0=473(x), r1=42(y), r2=17(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 42
LDI r2, 17
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
