; DESCRIPTION: Draws a green rectangle at (328, 133) with width 46 and height 81.
; PLAN: r0=328(x), r1=133(y), r2=46(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 133
LDI r2, 46
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
