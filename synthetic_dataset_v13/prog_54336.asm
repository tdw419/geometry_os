; DESCRIPTION: Creates a purple rectangular region at (441, 108) spanning 11 by 30 pixels.
; PLAN: r0=441(x), r1=108(y), r2=11(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 108
LDI r2, 11
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
