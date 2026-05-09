; DESCRIPTION: Creates a purple rectangular region at (236, 2) spanning 23 by 108 pixels.
; PLAN: r0=236(x), r1=2(y), r2=23(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 2
LDI r2, 23
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
