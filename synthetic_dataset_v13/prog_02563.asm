; DESCRIPTION: Creates a purple rectangular region at (132, 83) spanning 81 by 90 pixels.
; PLAN: r0=132(x), r1=83(y), r2=81(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 83
LDI r2, 81
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
