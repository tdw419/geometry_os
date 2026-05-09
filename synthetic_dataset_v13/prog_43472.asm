; DESCRIPTION: Creates a purple rectangular region at (167, 192) spanning 85 by 14 pixels.
; PLAN: r0=167(x), r1=192(y), r2=85(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 192
LDI r2, 85
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
