; DESCRIPTION: Renders a blue box of size 110x116 starting at (399, 133).
; PLAN: r0=399(x), r1=133(y), r2=110(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 133
LDI r2, 110
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
