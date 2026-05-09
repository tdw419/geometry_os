; DESCRIPTION: Draws a yellow rectangle at (440, 76) with width 13 and height 42.
; PLAN: r0=440(x), r1=76(y), r2=13(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 76
LDI r2, 13
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
