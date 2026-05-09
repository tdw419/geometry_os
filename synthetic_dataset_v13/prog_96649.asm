; DESCRIPTION: Creates a blue rectangular region at (100, 79) spanning 87 by 102 pixels.
; PLAN: r0=100(x), r1=79(y), r2=87(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 79
LDI r2, 87
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
