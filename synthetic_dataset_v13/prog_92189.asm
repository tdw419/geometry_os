; DESCRIPTION: Renders a white box of size 60x106 starting at (192, 116).
; PLAN: r0=192(x), r1=116(y), r2=60(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 116
LDI r2, 60
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
