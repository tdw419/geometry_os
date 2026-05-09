; DESCRIPTION: Creates a purple rectangular region at (274, 115) spanning 13 by 19 pixels.
; PLAN: r0=274(x), r1=115(y), r2=13(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 115
LDI r2, 13
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
