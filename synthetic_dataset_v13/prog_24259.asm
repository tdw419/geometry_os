; DESCRIPTION: Creates a purple rectangular region at (444, 98) spanning 38 by 101 pixels.
; PLAN: r0=444(x), r1=98(y), r2=38(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 98
LDI r2, 38
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
