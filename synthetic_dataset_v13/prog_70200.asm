; DESCRIPTION: Creates a purple rectangular region at (382, 108) spanning 23 by 31 pixels.
; PLAN: r0=382(x), r1=108(y), r2=23(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 108
LDI r2, 23
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
