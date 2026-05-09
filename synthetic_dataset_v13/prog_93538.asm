; DESCRIPTION: Draws a yellow rectangle at (178, 31) with width 82 and height 69.
; PLAN: r0=178(x), r1=31(y), r2=82(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 31
LDI r2, 82
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
