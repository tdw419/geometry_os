; DESCRIPTION: Creates a purple rectangular region at (375, 57) spanning 95 by 39 pixels.
; PLAN: r0=375(x), r1=57(y), r2=95(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 57
LDI r2, 95
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
