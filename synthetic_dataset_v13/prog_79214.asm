; DESCRIPTION: Draws a yellow rectangle at (76, 10) with width 100 and height 16.
; PLAN: r0=76(x), r1=10(y), r2=100(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 10
LDI r2, 100
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
