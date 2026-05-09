; DESCRIPTION: Draws a green rectangle at (330, 133) with width 113 and height 84.
; PLAN: r0=330(x), r1=133(y), r2=113(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 133
LDI r2, 113
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
