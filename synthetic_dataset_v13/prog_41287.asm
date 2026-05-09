; DESCRIPTION: Draws a yellow rectangle at (128, 30) with width 91 and height 45.
; PLAN: r0=128(x), r1=30(y), r2=91(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 30
LDI r2, 91
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
