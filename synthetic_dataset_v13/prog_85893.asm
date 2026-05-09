; DESCRIPTION: Draws a black rectangle at (37, 32) with width 72 and height 65.
; PLAN: r0=37(x), r1=32(y), r2=72(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 32
LDI r2, 72
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
