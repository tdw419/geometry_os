; DESCRIPTION: Draws a yellow rectangle at (344, 185) with width 82 and height 58.
; PLAN: r0=344(x), r1=185(y), r2=82(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 185
LDI r2, 82
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
