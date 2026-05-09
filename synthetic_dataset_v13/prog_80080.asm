; DESCRIPTION: Draws a black rectangle at (231, 142) with width 113 and height 70.
; PLAN: r0=231(x), r1=142(y), r2=113(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 142
LDI r2, 113
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
