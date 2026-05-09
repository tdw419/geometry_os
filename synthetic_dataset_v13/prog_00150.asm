; DESCRIPTION: Renders a white box of size 49x116 starting at (109, 85).
; PLAN: r0=109(x), r1=85(y), r2=49(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 85
LDI r2, 49
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
