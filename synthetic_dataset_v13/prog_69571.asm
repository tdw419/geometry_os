; DESCRIPTION: Creates a purple rectangular region at (192, 176) spanning 43 by 73 pixels.
; PLAN: r0=192(x), r1=176(y), r2=43(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 176
LDI r2, 43
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
