; DESCRIPTION: Creates a purple rectangular region at (142, 185) spanning 37 by 40 pixels.
; PLAN: r0=142(x), r1=185(y), r2=37(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 185
LDI r2, 37
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
