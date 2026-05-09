; DESCRIPTION: Creates a purple rectangular region at (422, 138) spanning 19 by 116 pixels.
; PLAN: r0=422(x), r1=138(y), r2=19(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 138
LDI r2, 19
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
