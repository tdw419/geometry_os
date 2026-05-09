; DESCRIPTION: Renders a white box of size 112x81 starting at (244, 51).
; PLAN: r0=244(x), r1=51(y), r2=112(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 51
LDI r2, 112
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
