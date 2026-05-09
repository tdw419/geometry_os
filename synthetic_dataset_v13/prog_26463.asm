; DESCRIPTION: Creates a purple rectangular region at (157, 108) spanning 29 by 44 pixels.
; PLAN: r0=157(x), r1=108(y), r2=29(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 108
LDI r2, 29
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
