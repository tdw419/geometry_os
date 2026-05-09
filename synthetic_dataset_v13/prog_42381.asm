; DESCRIPTION: Creates a purple rectangular region at (316, 112) spanning 84 by 64 pixels.
; PLAN: r0=316(x), r1=112(y), r2=84(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 112
LDI r2, 84
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
