; DESCRIPTION: Draws a white rectangle at (32, 30) with width 106 and height 95.
; PLAN: r0=32(x), r1=30(y), r2=106(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 30
LDI r2, 106
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
