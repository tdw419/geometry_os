; DESCRIPTION: Creates a blue rectangular region at (317, 14) spanning 79 by 66 pixels.
; PLAN: r0=317(x), r1=14(y), r2=79(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 14
LDI r2, 79
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
