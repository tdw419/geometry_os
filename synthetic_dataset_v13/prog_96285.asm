; DESCRIPTION: Creates a purple rectangular region at (4, 112) spanning 119 by 120 pixels.
; PLAN: r0=4(x), r1=112(y), r2=119(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 112
LDI r2, 119
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
