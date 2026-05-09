; DESCRIPTION: Creates a purple rectangular region at (49, 159) spanning 83 by 39 pixels.
; PLAN: r0=49(x), r1=159(y), r2=83(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 159
LDI r2, 83
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
