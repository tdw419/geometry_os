; DESCRIPTION: Creates a purple rectangular region at (293, 153) spanning 20 by 90 pixels.
; PLAN: r0=293(x), r1=153(y), r2=20(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 153
LDI r2, 20
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
