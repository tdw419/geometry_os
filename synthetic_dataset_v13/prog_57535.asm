; DESCRIPTION: Creates a purple rectangular region at (5, 51) spanning 14 by 112 pixels.
; PLAN: r0=5(x), r1=51(y), r2=14(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 51
LDI r2, 14
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
