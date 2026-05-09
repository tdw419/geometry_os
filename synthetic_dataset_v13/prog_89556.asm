; DESCRIPTION: Creates a purple rectangular region at (73, 48) spanning 108 by 55 pixels.
; PLAN: r0=73(x), r1=48(y), r2=108(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 48
LDI r2, 108
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
