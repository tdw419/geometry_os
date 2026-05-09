; DESCRIPTION: Creates a purple rectangular region at (221, 192) spanning 47 by 15 pixels.
; PLAN: r0=221(x), r1=192(y), r2=47(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 192
LDI r2, 47
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
