; DESCRIPTION: Creates a purple rectangular region at (235, 13) spanning 119 by 13 pixels.
; PLAN: r0=235(x), r1=13(y), r2=119(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 13
LDI r2, 119
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
