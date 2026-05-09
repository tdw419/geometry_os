; DESCRIPTION: Creates a purple rectangular region at (310, 192) spanning 70 by 15 pixels.
; PLAN: r0=310(x), r1=192(y), r2=70(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 192
LDI r2, 70
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
