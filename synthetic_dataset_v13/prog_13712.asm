; DESCRIPTION: Creates a purple rectangular region at (133, 3) spanning 86 by 90 pixels.
; PLAN: r0=133(x), r1=3(y), r2=86(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 3
LDI r2, 86
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
