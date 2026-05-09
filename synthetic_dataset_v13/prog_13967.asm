; DESCRIPTION: Draws a green rectangle at (235, 132) with width 97 and height 91.
; PLAN: r0=235(x), r1=132(y), r2=97(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 132
LDI r2, 97
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
