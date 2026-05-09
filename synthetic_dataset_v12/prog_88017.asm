; DESCRIPTION: Creates a blue rectangular region at (133, 117) spanning 92 by 30 pixels.
; PLAN: r0=133(x), r1=117(y), r2=92(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 117
LDI r2, 92
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
