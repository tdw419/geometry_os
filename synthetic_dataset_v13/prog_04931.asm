; DESCRIPTION: Creates a purple rectangular region at (195, 38) spanning 55 by 37 pixels.
; PLAN: r0=195(x), r1=38(y), r2=55(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 38
LDI r2, 55
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
