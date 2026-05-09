; DESCRIPTION: Draws a yellow rectangle at (7, 42) with width 23 and height 101.
; PLAN: r0=7(x), r1=42(y), r2=23(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 42
LDI r2, 23
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
