; DESCRIPTION: Draws a yellow rectangle at (100, 23) with width 103 and height 16.
; PLAN: r0=100(x), r1=23(y), r2=103(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 23
LDI r2, 103
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
