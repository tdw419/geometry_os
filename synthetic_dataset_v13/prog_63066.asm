; DESCRIPTION: Creates a blue rectangular region at (143, 79) spanning 33 by 89 pixels.
; PLAN: r0=143(x), r1=79(y), r2=33(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 79
LDI r2, 33
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
