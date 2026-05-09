; DESCRIPTION: Creates a purple rectangular region at (293, 66) spanning 112 by 92 pixels.
; PLAN: r0=293(x), r1=66(y), r2=112(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 66
LDI r2, 112
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
