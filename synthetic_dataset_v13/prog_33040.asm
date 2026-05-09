; DESCRIPTION: Creates a blue rectangular region at (99, 79) spanning 45 by 12 pixels.
; PLAN: r0=99(x), r1=79(y), r2=45(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 79
LDI r2, 45
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
