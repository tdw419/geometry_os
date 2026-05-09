; DESCRIPTION: Creates a purple rectangular region at (13, 64) spanning 56 by 60 pixels.
; PLAN: r0=13(x), r1=64(y), r2=56(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 64
LDI r2, 56
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
