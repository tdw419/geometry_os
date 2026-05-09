; DESCRIPTION: Creates a purple rectangular region at (371, 112) spanning 114 by 85 pixels.
; PLAN: r0=371(x), r1=112(y), r2=114(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 112
LDI r2, 114
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
