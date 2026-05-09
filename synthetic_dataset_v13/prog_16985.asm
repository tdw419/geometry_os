; DESCRIPTION: Draws a white rectangle at (260, 150) with width 106 and height 94.
; PLAN: r0=260(x), r1=150(y), r2=106(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 150
LDI r2, 106
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
