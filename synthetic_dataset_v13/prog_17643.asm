; DESCRIPTION: Creates a purple rectangular region at (47, 142) spanning 112 by 112 pixels.
; PLAN: r0=47(x), r1=142(y), r2=112(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 142
LDI r2, 112
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
