; DESCRIPTION: Creates a purple rectangular region at (353, 16) spanning 83 by 21 pixels.
; PLAN: r0=353(x), r1=16(y), r2=83(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 16
LDI r2, 83
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
