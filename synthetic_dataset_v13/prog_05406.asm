; DESCRIPTION: Creates a purple rectangular region at (414, 204) spanning 19 by 30 pixels.
; PLAN: r0=414(x), r1=204(y), r2=19(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 204
LDI r2, 19
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
