; DESCRIPTION: Creates a purple rectangular region at (13, 172) spanning 34 by 24 pixels.
; PLAN: r0=13(x), r1=172(y), r2=34(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 172
LDI r2, 34
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
