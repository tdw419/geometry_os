; DESCRIPTION: Creates a purple rectangular region at (73, 30) spanning 108 by 59 pixels.
; PLAN: r0=73(x), r1=30(y), r2=108(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 30
LDI r2, 108
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
