; DESCRIPTION: Creates a purple rectangular region at (400, 49) spanning 13 by 65 pixels.
; PLAN: r0=400(x), r1=49(y), r2=13(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 49
LDI r2, 13
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
