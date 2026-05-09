; DESCRIPTION: Creates a purple rectangular region at (492, 61) spanning 10 by 108 pixels.
; PLAN: r0=492(x), r1=61(y), r2=10(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 61
LDI r2, 10
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
