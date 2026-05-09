; DESCRIPTION: Creates a blue rectangular region at (331, 133) spanning 79 by 31 pixels.
; PLAN: r0=331(x), r1=133(y), r2=79(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 133
LDI r2, 79
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
