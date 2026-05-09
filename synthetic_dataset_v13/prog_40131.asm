; DESCRIPTION: Creates a blue rectangular region at (172, 31) spanning 66 by 116 pixels.
; PLAN: r0=172(x), r1=31(y), r2=66(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 31
LDI r2, 66
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
