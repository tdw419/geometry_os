; DESCRIPTION: Renders a white box of size 60x46 starting at (116, 122).
; PLAN: r0=116(x), r1=122(y), r2=60(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 122
LDI r2, 60
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
