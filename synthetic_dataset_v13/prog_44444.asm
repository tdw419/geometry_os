; DESCRIPTION: Draws a black rectangle at (210, 32) with width 80 and height 23.
; PLAN: r0=210(x), r1=32(y), r2=80(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 32
LDI r2, 80
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
