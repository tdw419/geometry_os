; DESCRIPTION: Creates a purple rectangular region at (188, 29) spanning 44 by 105 pixels.
; PLAN: r0=188(x), r1=29(y), r2=44(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 29
LDI r2, 44
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
