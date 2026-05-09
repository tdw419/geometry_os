; DESCRIPTION: Draws a white rectangle at (132, 87) with width 95 and height 95.
; PLAN: r0=132(x), r1=87(y), r2=95(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 87
LDI r2, 95
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
