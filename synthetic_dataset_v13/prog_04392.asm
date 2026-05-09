; DESCRIPTION: Creates a purple rectangular region at (99, 32) spanning 85 by 39 pixels.
; PLAN: r0=99(x), r1=32(y), r2=85(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 32
LDI r2, 85
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
