; DESCRIPTION: Creates a purple rectangular region at (374, 162) spanning 108 by 29 pixels.
; PLAN: r0=374(x), r1=162(y), r2=108(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 162
LDI r2, 108
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
