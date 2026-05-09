; DESCRIPTION: Creates a purple rectangular region at (250, 95) spanning 71 by 97 pixels.
; PLAN: r0=250(x), r1=95(y), r2=71(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 95
LDI r2, 71
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
