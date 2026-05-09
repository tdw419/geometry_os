; DESCRIPTION: Creates a purple rectangular region at (212, 199) spanning 70 by 39 pixels.
; PLAN: r0=212(x), r1=199(y), r2=70(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 199
LDI r2, 70
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
