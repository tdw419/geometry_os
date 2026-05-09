; DESCRIPTION: Creates a blue rectangular region at (379, 153) spanning 88 by 79 pixels.
; PLAN: r0=379(x), r1=153(y), r2=88(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 153
LDI r2, 88
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
