; DESCRIPTION: Creates a purple rectangular region at (374, 94) spanning 72 by 65 pixels.
; PLAN: r0=374(x), r1=94(y), r2=72(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 94
LDI r2, 72
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
