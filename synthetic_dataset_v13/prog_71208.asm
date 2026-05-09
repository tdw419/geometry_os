; DESCRIPTION: Draws a black rectangle at (5, 32) with width 91 and height 70.
; PLAN: r0=5(x), r1=32(y), r2=91(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 32
LDI r2, 91
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
