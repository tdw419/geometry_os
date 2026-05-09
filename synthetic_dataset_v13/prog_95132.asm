; DESCRIPTION: Draws a black rectangle at (169, 143) with width 107 and height 97.
; PLAN: r0=169(x), r1=143(y), r2=107(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 143
LDI r2, 107
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
