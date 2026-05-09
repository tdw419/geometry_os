; DESCRIPTION: Renders a white box of size 81x106 starting at (135, 43).
; PLAN: r0=135(x), r1=43(y), r2=81(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 43
LDI r2, 81
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
