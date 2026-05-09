; DESCRIPTION: Creates a purple rectangular region at (15, 176) spanning 38 by 26 pixels.
; PLAN: r0=15(x), r1=176(y), r2=38(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 176
LDI r2, 38
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
