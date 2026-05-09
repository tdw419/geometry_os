; DESCRIPTION: Creates a purple rectangular region at (62, 159) spanning 57 by 45 pixels.
; PLAN: r0=62(x), r1=159(y), r2=57(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 159
LDI r2, 57
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
