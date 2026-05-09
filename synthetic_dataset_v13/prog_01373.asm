; DESCRIPTION: Renders a white box of size 84x96 starting at (15, 115).
; PLAN: r0=15(x), r1=115(y), r2=84(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 115
LDI r2, 84
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
