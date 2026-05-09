; DESCRIPTION: Creates a purple rectangular region at (206, 123) spanning 96 by 112 pixels.
; PLAN: r0=206(x), r1=123(y), r2=96(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 123
LDI r2, 96
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
