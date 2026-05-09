; DESCRIPTION: Renders a white box of size 116x51 starting at (49, 14).
; PLAN: r0=49(x), r1=14(y), r2=116(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 14
LDI r2, 116
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
