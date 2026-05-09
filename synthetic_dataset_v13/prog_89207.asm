; DESCRIPTION: Creates a purple rectangular region at (62, 45) spanning 21 by 16 pixels.
; PLAN: r0=62(x), r1=45(y), r2=21(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 45
LDI r2, 21
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
