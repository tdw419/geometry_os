; DESCRIPTION: Creates a purple rectangular region at (62, 54) spanning 32 by 47 pixels.
; PLAN: r0=62(x), r1=54(y), r2=32(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 54
LDI r2, 32
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
