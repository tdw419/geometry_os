; DESCRIPTION: Creates a purple rectangular region at (225, 172) spanning 97 by 79 pixels.
; PLAN: r0=225(x), r1=172(y), r2=97(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 172
LDI r2, 97
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
