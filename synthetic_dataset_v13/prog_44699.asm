; DESCRIPTION: Creates a purple rectangular region at (205, 124) spanning 95 by 69 pixels.
; PLAN: r0=205(x), r1=124(y), r2=95(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 124
LDI r2, 95
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
