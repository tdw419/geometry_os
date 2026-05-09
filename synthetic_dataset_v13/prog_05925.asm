; DESCRIPTION: Creates a purple rectangular region at (274, 124) spanning 57 by 105 pixels.
; PLAN: r0=274(x), r1=124(y), r2=57(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 124
LDI r2, 57
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
