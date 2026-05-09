; DESCRIPTION: Creates a purple rectangular region at (235, 23) spanning 115 by 52 pixels.
; PLAN: r0=235(x), r1=23(y), r2=115(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 23
LDI r2, 115
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
