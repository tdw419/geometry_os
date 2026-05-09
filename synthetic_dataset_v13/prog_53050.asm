; DESCRIPTION: Creates a blue rectangular region at (181, 63) spanning 13 by 55 pixels.
; PLAN: r0=181(x), r1=63(y), r2=13(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 63
LDI r2, 13
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
