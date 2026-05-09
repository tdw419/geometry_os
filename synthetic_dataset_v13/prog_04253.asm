; DESCRIPTION: Creates a purple rectangular region at (430, 112) spanning 28 by 43 pixels.
; PLAN: r0=430(x), r1=112(y), r2=28(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 112
LDI r2, 28
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
