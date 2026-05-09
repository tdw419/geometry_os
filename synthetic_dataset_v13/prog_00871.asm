; DESCRIPTION: Draws a black rectangle at (69, 156) with width 80 and height 82.
; PLAN: r0=69(x), r1=156(y), r2=80(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 156
LDI r2, 80
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
