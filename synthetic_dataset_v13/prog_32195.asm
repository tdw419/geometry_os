; DESCRIPTION: Creates a blue rectangular region at (328, 185) spanning 84 by 63 pixels.
; PLAN: r0=328(x), r1=185(y), r2=84(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 185
LDI r2, 84
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
