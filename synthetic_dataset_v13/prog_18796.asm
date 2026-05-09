; DESCRIPTION: Creates a purple rectangular region at (203, 13) spanning 108 by 76 pixels.
; PLAN: r0=203(x), r1=13(y), r2=108(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 13
LDI r2, 108
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
