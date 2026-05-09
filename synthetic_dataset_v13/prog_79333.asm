; DESCRIPTION: Creates a blue rectangular region at (111, 11) spanning 79 by 84 pixels.
; PLAN: r0=111(x), r1=11(y), r2=79(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 11
LDI r2, 79
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
