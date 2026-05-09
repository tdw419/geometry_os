; DESCRIPTION: Draws a black rectangle at (38, 16) with width 10 and height 23.
; PLAN: r0=38(x), r1=16(y), r2=10(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 16
LDI r2, 10
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
