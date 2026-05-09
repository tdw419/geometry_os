; DESCRIPTION: Draws a yellow rectangle at (168, 61) with width 87 and height 69.
; PLAN: r0=168(x), r1=61(y), r2=87(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 61
LDI r2, 87
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
