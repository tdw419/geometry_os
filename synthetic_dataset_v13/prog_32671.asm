; DESCRIPTION: Draws a yellow rectangle at (464, 24) with width 26 and height 23.
; PLAN: r0=464(x), r1=24(y), r2=26(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 24
LDI r2, 26
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
