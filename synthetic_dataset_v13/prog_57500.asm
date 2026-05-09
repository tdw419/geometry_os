; DESCRIPTION: Creates a purple rectangular region at (191, 191) spanning 43 by 50 pixels.
; PLAN: r0=191(x), r1=191(y), r2=43(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 191
LDI r2, 43
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
