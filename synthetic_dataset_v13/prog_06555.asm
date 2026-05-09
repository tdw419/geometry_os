; DESCRIPTION: Creates a purple rectangular region at (51, 112) spanning 24 by 103 pixels.
; PLAN: r0=51(x), r1=112(y), r2=24(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 112
LDI r2, 24
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
