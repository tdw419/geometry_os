; DESCRIPTION: Creates a purple rectangular region at (149, 84) spanning 28 by 10 pixels.
; PLAN: r0=149(x), r1=84(y), r2=28(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 84
LDI r2, 28
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
