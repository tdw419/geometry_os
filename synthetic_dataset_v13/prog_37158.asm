; DESCRIPTION: Creates a purple rectangular region at (39, 29) spanning 37 by 69 pixels.
; PLAN: r0=39(x), r1=29(y), r2=37(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 29
LDI r2, 37
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
